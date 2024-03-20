import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';
import 'package:injectable/injectable.dart';
import '../../../core/locator/locator.dart';
import '../data/subscription_remote_data_source.dart';

abstract class PurchasedProductChangeDelegate { // Ideally should have been broken into two delegate in order not to violate Interface Segregation but there is only one method that makes the difference
  void didRestorePurchase(PurchaseDetails purchaseDetails);

  void didBuyPurchase(PurchaseDetails purchaseDetails);

  void didFindNoSubscription();


  void isPending(PurchaseDetails purchaseDetails) {}

  void didReceivedErrorIndicatingItemOwned(bool hasBought) {}
}


@singleton
class InAppPurchaseInteractor implements SKPaymentQueueDelegateWrapper {

  // Constants
  static const kiOSInAppSubscriptionProduct = 'kM89mcnts7.pick.me';
  static const shouldDisableInAppPurchasesOnAndroid = false; // Client requirement for the time being, in App Purchase on Android Will be enabled later
  static String get kAndroidInAppSubscriptionProduct =>
      kReleaseMode
          ? 'name_of_android_in_app_purchase'
          : 'android.test.purchased';

  // Computed properties
  List<String> get subscriptionProductIds  {
    if (Platform.isAndroid)  {
      return shouldDisableInAppPurchasesOnAndroid ? [kAndroidInAppSubscriptionProduct] : List.empty();
    } else if (Platform.isIOS) {
      return [kiOSInAppSubscriptionProduct];
    }
    return [];
  }

  // Immutable and Mutable properties
  late final subscriptionRemoteDatasource = locator<
      SubscriptionRemoteDatasource>();
  late final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  final List<PurchasedProductChangeDelegate> _delegates = List.empty(growable: true);
  StreamSubscription<List<PurchaseDetails>>? _subscription;
  List<PurchaseDetails> _purchaseDetailsList =  List<PurchaseDetails>.empty(growable: true);
  late final Stream<List<PurchaseDetails>> purchaseUpdated =
      _inAppPurchase.purchaseStream;

  bool _initialised = false;

  InAppPurchaseInteractor() {
    _subscribeToPurchaseEvent();
  }

  _subscribeToPurchaseEvent() {
    if (_initialised) return;
    _subscription =
        purchaseUpdated.listen((List<PurchaseDetails> purchaseDetailsList) {
          _onSubscriptionUpdate(purchaseDetailsList);
        }, onDone: () {
          _initialised = true;
        }, onError: (Object error) {
          _initialised = false;
          debugPrint(error.toString());
        });
  }

  @override
  bool shouldContinueTransaction(SKPaymentTransactionWrapper transaction,
      SKStorefrontWrapper storefront) {
    return true;
  }

  @override
  bool shouldShowPriceConsent() {
    return false;
  }

  addDelegate(PurchasedProductChangeDelegate delegate) => _delegates.add(delegate);

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

    final ProductDetailsResponse productDetailResponse =
    await _inAppPurchase.queryProductDetails(subscriptionProductIds.toSet());
    if (productDetailResponse.error != null) {
      return Future.value(false);
    }

    if (productDetailResponse.productDetails.isEmpty) {
      return Future.value(false);
    }
    List<String> purchasedIds =
    _purchaseDetailsList.map((e) => e.productID).toList();
    final hasBoughtAllProducts =
    subscriptionProductIds.every((element) => purchasedIds.contains(element));
    return Future.value(!hasBoughtAllProducts);
  }

  Future<bool> isAvailable() async => await _inAppPurchase.isAvailable();

  Future<bool>  buyNonConsumable(PurchaseParam purchaseParam) async => _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);


  Future restorePurchases() async {
    await InAppPurchase.instance.restorePurchases();
  }

  void _onSubscriptionUpdate(
      List<PurchaseDetails> purchaseDetailsList) async {
    if (purchaseDetailsList.isEmpty) {
      for (final delegate in _delegates) {
        delegate?.didFindNoSubscription();
      }
      return;
    }
    for (var purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        for (final delegate in _delegates) {
          delegate?.isPending(purchaseDetails);
        }
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          final hasBought =
          purchaseDetails.error?.message?.contains("itemAlreadyOwned");
          _purchaseDetailsList = purchaseDetailsList;
          for (final delegate in _delegates) {
            delegate.didReceivedErrorIndicatingItemOwned(hasBought ?? false);
          }
        } else if (purchaseDetails.status == PurchaseStatus.restored) {
          _purchaseDetailsList = purchaseDetailsList;

          for (final delegate in _delegates) {
            delegate.didRestorePurchase(purchaseDetails);
          }
        } else if (purchaseDetails.status == PurchaseStatus.purchased) {
          _purchaseDetailsList = purchaseDetailsList;

          for (final delegate in _delegates) {
            delegate.didBuyPurchase(purchaseDetails);
          }
        }
        if (purchaseDetails.pendingCompletePurchase) {
          await InAppPurchase.instance.completePurchase(purchaseDetails);
        }
      }
    }
  }

  completeTransaction(PurchaseDetails purchaseDetails) async {
    try {
      await InAppPurchase.instance.completePurchase(purchaseDetails);
    } catch (exception, stackTrace) {
      debugPrint(exception.toString());
      debugPrintStack(stackTrace: stackTrace);
    }
  }
}
