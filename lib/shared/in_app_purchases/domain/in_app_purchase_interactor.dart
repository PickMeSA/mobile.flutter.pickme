import 'dart:io';
import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/localization/generated/l10n.dart';
import '../../../core/locator/locator.dart';
import '../data/subscription_remote_data_source.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:pickme/shared/in_app_purchases/domain/product_purchase_state_change_delegate.dart';

@singleton
class InAppPurchaseInteractor implements SKPaymentQueueDelegateWrapper {
  // Constants
  late final kiOSInAppSubscriptionProduct = dotenv.env['IOS_IN_APP_PURCHASE_PRODUCT'];
  static const shouldDisableInAppPurchasesOnAndroid =
      false; // Client requirement for the time being, in App Purchase on Android Will be enabled later
  static String get kAndroidInAppSubscriptionProduct => kReleaseMode
      ? 'name_of_android_in_app_purchase'
      : 'android.test.purchased';

  // Computed properties
  List<String> get subscriptionProductIds {
    if (Platform.isAndroid) {
      return shouldDisableInAppPurchasesOnAndroid
          ? [kAndroidInAppSubscriptionProduct]
          : List.empty();
    } else if (Platform.isIOS) {
      if(kiOSInAppSubscriptionProduct == null){
        AppLocalizations localization = locator<AppLocalizations>();
        throw Exception(localization.inAppPurchaseProductNotSetError);
      }
      return [kiOSInAppSubscriptionProduct!];
    }
    return [];
  }

  // Immutable and Mutable properties
  late final logger = Logger(printer: PrettyPrinter());
  late final subscriptionRemoteDatasource =
      locator<SubscriptionRemoteDatasource>();
  late final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  final List<WeakReference<PurchasedProductChangeDelegate>?> _delegates =
      List.empty(growable: true);
  List<PurchaseDetails> _purchaseDetailsList =
      List<PurchaseDetails>.empty(growable: true);
  late final Stream<List<PurchaseDetails>> purchaseUpdated =
      _inAppPurchase.purchaseStream;

  bool _initialised = false;

  InAppPurchaseInteractor() {
    _subscribeToPurchaseEvent();
  }


  // Delegate management

  addDelegate(PurchasedProductChangeDelegate delegate) =>
      _delegates.add(WeakReference(delegate));

  removeDelegate(PurchasedProductChangeDelegate delegate) =>
      _delegates.removeWhere((element) => element?.target == delegate);


  // Subscribing and handling in-app purchases

  _subscribeToPurchaseEvent() {
    if (_initialised) return;
    purchaseUpdated.listen((List<PurchaseDetails> purchaseDetailsList) {
      _onSubscriptionUpdate(purchaseDetailsList);
    }, onDone: () {
      _initialised = true;
    }, onError: (Object error) {
      _initialised = false;
      debugPrint(error.toString());
    });
  }


  _onSubscriptionUpdate(List<PurchaseDetails> purchaseDetailsList) async {
    if (purchaseDetailsList.isEmpty) {
      for (final delegate in _delegates) {
        delegate?.target?.didFindNoSubscription();
      }
      return;
    }
    await _handlePurchaseStateChange(purchaseDetailsList);
  }

  _handlePurchaseStateChange(List<PurchaseDetails> purchaseDetailsList) async {
    for (var purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        for (final delegate in _delegates) {
          delegate?.target?.isPending(purchaseDetails);
        }
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          final hasBought =
          purchaseDetails.error?.message?.contains("itemAlreadyOwned");
          _purchaseDetailsList = purchaseDetailsList;
          for (final delegate in _delegates) {
            delegate?.target?.didReceivedErrorIndicatingItemOwned(hasBought ?? false, purchaseDetails.error?.message);
          }
        } else if (purchaseDetails.status == PurchaseStatus.restored) {
          _purchaseDetailsList = purchaseDetailsList;

          for (final delegate in _delegates) {
            delegate?.target?.didRestorePurchase(purchaseDetails);
          }
        } else if (purchaseDetails.status == PurchaseStatus.purchased) {
          _purchaseDetailsList = purchaseDetailsList;

          for (final delegate in _delegates) {
            delegate?.target?.didBuyPurchase(purchaseDetails);
          }
        } else if (purchaseDetails.status == PurchaseStatus.canceled) {
          _purchaseDetailsList = purchaseDetailsList;

          for (final delegate in _delegates) {
            delegate?.target?.didCancelPayment(purchaseDetails);
          }
        }
        if (purchaseDetails.pendingCompletePurchase) {
          await InAppPurchase.instance.completePurchase(purchaseDetails);
        }
      }
    }
  }


  // SKPaymentQueueDelegateWrapper Implementation

  @override
  bool shouldContinueTransaction(SKPaymentTransactionWrapper transaction,
          SKStorefrontWrapper storefront) =>  true;

  @override
  bool shouldShowPriceConsent() => true;


  // Public API


  Future<bool> shouldEnableInAppPurchases() async {
    final bool isAvailable = await _inAppPurchase.isAvailable();
    if (!isAvailable) {
      return Future.value(false);
    }
    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition =
          _inAppPurchase
              .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await iosPlatformAddition.setDelegate(this);
    } else if (shouldDisableInAppPurchasesOnAndroid) {
      return false;
    }

    final ProductDetailsResponse productDetailResponse = await _inAppPurchase
        .queryProductDetails(subscriptionProductIds.toSet());
    if (productDetailResponse.error != null) {
      return Future.value(false);
    }

    if (productDetailResponse.productDetails.isEmpty) {
      return Future.value(false);
    }
    List<String> purchasedIds =
        _purchaseDetailsList.map((e) => e.productID).toList();
    final hasBoughtAllProducts = subscriptionProductIds
        .every((element) => purchasedIds.contains(element));
    return Future.value(!hasBoughtAllProducts);
  }

  Future<bool> isAvailable() async => await _inAppPurchase.isAvailable();

  Future<bool> buyNonConsumable(PurchaseParam purchaseParam) async =>
      _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);

  Future restorePurchases() async =>
      await InAppPurchase.instance.restorePurchases();

  Future completeTransaction(PurchaseDetails purchaseDetails) async {
    try {
      if ( purchaseDetails.pendingCompletePurchase) {
        await InAppPurchase.instance.completePurchase(purchaseDetails);
      } else {
        logger.e("Pending transaction ${purchaseDetails.transactionDate}, waiting for user action");
      }
    } catch (exception, stackTrace) {
      logger.e("Failed to complete transaction", error: exception, stackTrace: stackTrace);
    }
  }
}
