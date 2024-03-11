import 'dart:async';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/in_app_purchases/domain/in_app_purchase_interactor.dart';
import '../../../core/locator/locator.dart';


@injectable
class BuyInAppSubscriptionUseCase implements PurchasedProductChangeDelegate {
  late final inAppPurchaseInteractor = locator<InAppPurchaseInteractor>();


  BuyInAppSubscriptionUseCase() {
    inAppPurchaseInteractor.addDelegate(this);
  }

  Future<bool> call() async {
    final bool isAvailable = await inAppPurchaseInteractor.isAvailable();
    if (!isAvailable) {
      return Future.value(false);
    }
    final ProductDetailsResponse response = await InAppPurchase.instance
        .queryProductDetails(
            Set.from(inAppPurchaseInteractor.availableProductIds));
    List<ProductDetails> productDetails = response.productDetails;

    if (productDetails.isEmpty) {
      return false;
    }
    final purchaseParam = PurchaseParam(productDetails: productDetails.first);
    return inAppPurchaseInteractor.buyNonConsumable(purchaseParam);
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
