import 'dart:async';
import 'package:injectable/injectable.dart';
import '../../../core/locator/locator.dart';
import '../../../localization/generated/l10n.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:pickme/shared/in_app_purchases/domain/models/subscription_restore_result.dart';
import 'package:pickme/shared/in_app_purchases/domain/product_purchase_state_change_delegate.dart';

@injectable
class RestoreInAppSubscriptionUseCase extends PurchasedProductChangeDelegate {
  WeakReference<SubscriptionRestoreResultHandler>? _currentTransactionHandler;
  late final localization = locator<AppLocalizations>();

  RestoreInAppSubscriptionUseCase() {
    inAppPurchaseInteractor.addDelegate(this);
  }

  Future<bool> call() async {
    final bool isAvailable = await inAppPurchaseInteractor.isAvailable();
    if (!isAvailable) {
      return isAvailable;
    }
    await InAppPurchase.instance.restorePurchases();
    return true;
  }

  // In-App Purchase Result Callbacks

  @override
  void didBuyPurchase(PurchaseDetails purchaseDetails) =>
      didRestorePurchase(purchaseDetails);

  @override
  void didRestorePurchase(PurchaseDetails purchaseDetails) {
    final inAppPurchaseDetails = makeInAppPurchaseDetails(purchaseDetails);
    _currentTransactionHandler?.target?.onSubscriptionRestoreResult(
        SubscriptionRestoreResult(purchaseDetails.productID, true,
            error: null, purchaseDetails: inAppPurchaseDetails));
  }

  @override
  void didCancelPayment(PurchaseDetails purchaseDetails) {
    // NOOP: Restore operation cannot be cancelled
  }

  @override
  void didFindNoSubscription() {
    _currentTransactionHandler?.target?.onSubscriptionRestoreResult(
        SubscriptionRestoreResult("", false,
            error: localization.subscriptionNotFound));
  }

  @override
  void didReceivedErrorIndicatingItemOwned(
      bool hasBought, String? errorMessage) {
    _currentTransactionHandler?.target?.onSubscriptionRestoreResult(
        SubscriptionRestoreResult("", hasBought, error: errorMessage));
  }
}
