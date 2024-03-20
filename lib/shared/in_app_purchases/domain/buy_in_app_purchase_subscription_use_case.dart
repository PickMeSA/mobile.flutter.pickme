import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/in_app_purchases/domain/in_app_purchase_interactor.dart';
import '../../../core/locator/locator.dart';


@immutable
class SubscriptionResult {
  final bool purchased;
  final List<String> productIds;

  const SubscriptionResult(this.purchased,  this.productIds);
}
@injectable
class BuyInAppSubscriptionUseCase implements PurchasedProductChangeDelegate {
  late final inAppPurchaseInteractor = locator<InAppPurchaseInteractor>();


  BuyInAppSubscriptionUseCase() {
    inAppPurchaseInteractor.addDelegate(this);
  }

  Future<SubscriptionResult> call() async {
    final bool isAvailable = await inAppPurchaseInteractor.isAvailable();
    if (!isAvailable) {
      return Future.value(const SubscriptionResult(false, []));
    }
    final subscriptionProductIds = inAppPurchaseInteractor.subscriptionProductIds;
    final ProductDetailsResponse response = await InAppPurchase.instance
        .queryProductDetails(
            Set.from(inAppPurchaseInteractor.subscriptionProductIds));
    List<ProductDetails> productDetails = response.productDetails;

    if (productDetails.isEmpty) {
      return SubscriptionResult(false, subscriptionProductIds);
    }
    final purchaseParam = PurchaseParam(productDetails: productDetails.first);
    final hasBoughtItem = await inAppPurchaseInteractor.buyNonConsumable(purchaseParam);
    return SubscriptionResult(hasBoughtItem, subscriptionProductIds);
  }

  @override
  void didBuyPurchase(PurchaseDetails purchaseDetails) {
    // NOOP: This Use case does not handle in app purchase restore
  }

  @override
  void didFindNoSubscription() {

  }

  @override
  void didReceivedErrorIndicatingItemOwned(bool hasBought) {

  }

  @override
  void isPending(PurchaseDetails purchaseDetails) {

  }

  @override
  void didRestorePurchase(PurchaseDetails purchaseDetails) {

  }
}
