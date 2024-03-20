part of '../in_app_purchase_bloc.dart';

@immutable
abstract class InAppPurchaseState extends BaseState {
  final String? error;
  final List<String>? products;

  InAppPurchaseState(this.error, this.products);
}


class InAppPurchasedState extends InAppPurchaseState {
  final bool isSubscriptionPurchased;

  InAppPurchasedState(
      super.error, super.products, this.isSubscriptionPurchased);
}

class InAppRestoredState extends InAppPurchaseState {
  final bool isSubcriptionRestored;

  InAppRestoredState(super.error, super.products, this.isSubcriptionRestored);
}

class InAppNotFoundState extends InAppPurchaseState {
  InAppNotFoundState(super.error, super.products);
}

class InAppPurchaseLoadingState extends InAppPurchaseState {
  InAppPurchaseLoadingState(super.error, super.products);
}
