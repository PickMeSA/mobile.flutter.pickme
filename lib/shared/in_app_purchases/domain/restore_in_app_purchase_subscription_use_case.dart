import 'dart:io';
import 'dart:async';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/in_app_purchases/domain/in_app_purchase_interactor.dart';
import '../../../core/locator/locator.dart';


@injectable
class RestoreInAppSubscriptionUseCase implements PurchasedProductChangeDelegate {
  late final inAppPurchaseInteractor = locator<InAppPurchaseInteractor>();

  RestoreInAppSubscriptionUseCase() {
    inAppPurchaseInteractor.addDelegate(this);
  }

  Future<void> call() async => inAppPurchaseInteractor.restorePurchases();

  @override
  void didBuyPurchase(PurchaseDetails purchaseDetails) {
    // TODO: implement didBuyPurchase
  }

  @override
  void didFindNoSubscription() {
    // TODO: implement didFindNoSubscription
  }

  @override
  void didReceivedErrorIndicatingItemOwned(bool hasBought) {
    // TODO: implement didReceivedErrorIndicatingItemOwned
  }

  @override
  void didRestorePurchase(PurchaseDetails purchaseDetails) {
    // TODO: implement didRestorePurchase
  }

  @override
  void isPending(PurchaseDetails purchaseDetails) {
    // TODO: implement isPending
  }


}
