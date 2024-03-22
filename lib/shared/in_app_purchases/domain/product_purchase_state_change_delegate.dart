import '../presentation/models/in_app_purchase_details.dart';
import 'in_app_purchase_interactor.dart';
import '../../../core/locator/locator.dart';
import 'models/subscription_payment_result.dart';
import 'models/subscription_restore_result.dart';
import 'package:in_app_purchase/in_app_purchase.dart';


abstract class SubscriptionPaymentResultHandler {
  onSubscriptionPurchaseResult(SubscriptionPaymentResult result);
}

abstract class SubscriptionRestoreResultHandler {
  onSubscriptionRestoreResult(SubscriptionRestoreResult result);
}

abstract class PurchasedProductChangeDelegate {
  // Ideally should have been broken into two delegate in order not to violate Interface Segregation but there is only one method that makes the difference
  static const kDuplicateProductIdentifier =
      'storekit_duplicate_product_object';

  late final inAppPurchaseInteractor = locator<InAppPurchaseInteractor>();


  isPending(PurchaseDetails purchaseDetails) =>
      inAppPurchaseInteractor.completeTransaction(purchaseDetails);

  didReceivedErrorIndicatingItemOwned(bool hasBought, String? errorMessage);

  didFindNoSubscription();

  didBuyPurchase(PurchaseDetails purchaseDetails);

  didRestorePurchase(PurchaseDetails purchaseDetails);

  didCancelPayment(PurchaseDetails purchaseDetails);


  InAppPurchaseDetails? makeInAppPurchaseDetails(PurchaseDetails purchaseDetails) {
    final serverVerificationData =
        purchaseDetails.verificationData.serverVerificationData;

    final InAppPurchaseDetails? inAppPurchaseDetails;
    if (serverVerificationData != null) {
      inAppPurchaseDetails = InAppPurchaseDetails(
        serverVerificationData,
        purchaseDetails.purchaseID,
      );
    } else {
      inAppPurchaseDetails = null;
    }
    return inAppPurchaseDetails;
  }
}