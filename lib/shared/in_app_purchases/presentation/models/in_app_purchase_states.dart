part of '../in_app_purchase_bloc.dart';

@immutable
abstract class InAppPurchaseState extends BaseState {
  final String? error;
  final String? product;

  InAppPurchaseState(this.error, this.product);
}


class InAppPurchasedState extends InAppPurchaseState {
  final bool isSubscriptionPurchased;
  final bool isPurchasedCancelled;
  final InAppPurchaseDetails? purchaseDetails;

  InAppPurchasedState(
      super.error, super.products, this.isSubscriptionPurchased, this.isPurchasedCancelled, this.purchaseDetails);
}

class InAppRestoredState extends InAppPurchaseState {
  final bool isSubscriptionRestored;
  final InAppPurchaseDetails? purchaseDetails;

  InAppRestoredState(super.error, super.products, this.isSubscriptionRestored, this.purchaseDetails);
}

class InAppNotFoundState extends InAppPurchaseState {
  InAppNotFoundState(super.error, super.products);
}

class InAppPurchaseLoadingState extends InAppPurchaseState {
  InAppPurchaseLoadingState(super.error, super.products);
}
