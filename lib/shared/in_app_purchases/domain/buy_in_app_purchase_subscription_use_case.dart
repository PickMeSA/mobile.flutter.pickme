import 'dart:async';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import '../presentation/models/in_app_purchase_details.dart';
import 'models/subscription_payment_result.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:pickme/shared/in_app_purchases/domain/product_purchase_state_change_delegate.dart';

@injectable
class BuyInAppSubscriptionUseCase extends PurchasedProductChangeDelegate {
  WeakReference<SubscriptionPaymentResultHandler>? _currentTransactionHandler;

  BuyInAppSubscriptionUseCase() {
    inAppPurchaseInteractor.addDelegate(this);
  }

  /*
  In App Purchase trigger
  Returns: true if in App Purchases are available on device
  Handler: It will be called back at a later stage when the user interacts with the In-App Controls
   */
  Future<bool> call(SubscriptionPaymentResultHandler handler) async {
    final bool isInAppPurchasesAvailable =
        await inAppPurchaseInteractor.isAvailable();
    if (!isInAppPurchasesAvailable) {
      return false;
    }
    _currentTransactionHandler = WeakReference(handler);
    final ProductDetailsResponse response = await InAppPurchase.instance
        .queryProductDetails(
            Set.from(inAppPurchaseInteractor.subscriptionProductIds));
    List<ProductDetails> productDetailsList = response.productDetails;

    if (productDetailsList.isEmpty) {
      return false;
    }
    final purchaseParam =
        PurchaseParam(productDetails: productDetailsList.first);
    try {
      await inAppPurchaseInteractor.buyNonConsumable(purchaseParam);
      return true;
    } on PlatformException catch (exception) {
      if (exception.code ==
          PurchasedProductChangeDelegate.kDuplicateProductIdentifier) {
        await inAppPurchaseInteractor.restorePurchases();
      }
      return false;
    } catch (ex) {
      rethrow;
    }
  }

  // In-App Purchase Result Callbacks

  @override
  void didBuyPurchase(PurchaseDetails purchaseDetails) {
    final inAppPurchaseDetails = makeInAppPurchaseDetails(purchaseDetails);
    _currentTransactionHandler?.target?.onSubscriptionPurchaseResult(
        SubscriptionPaymentResult(true, purchaseDetails.productID, false,  purchaseDetails:
        inAppPurchaseDetails));
  }

  @override
  void didRestorePurchase(PurchaseDetails purchaseDetails) {
    final inAppPurchaseDetails = makeInAppPurchaseDetails(purchaseDetails);
    _currentTransactionHandler?.target?.onSubscriptionPurchaseResult(
        SubscriptionPaymentResult(true, purchaseDetails.productID, false,
            purchaseDetails:
                inAppPurchaseDetails)); // A restore will treated as a purchase
  }


  @override
  void didCancelPayment(PurchaseDetails purchaseDetails) {
    _currentTransactionHandler?.target?.onSubscriptionPurchaseResult(
        SubscriptionPaymentResult(false, purchaseDetails.productID, true,  purchaseDetails:
        null));
  }

  @override
  void didFindNoSubscription() {
    // NOOP: This is only handle by the restore use case
  }

  @override
  void didReceivedErrorIndicatingItemOwned(
      bool hasBought, String? errorMessage) {
    _currentTransactionHandler?.target?.onSubscriptionPurchaseResult(
        SubscriptionPaymentResult(hasBought, "", false, error: errorMessage));
  }
}
