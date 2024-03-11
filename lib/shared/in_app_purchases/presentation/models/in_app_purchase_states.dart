import 'package:flutter/cupertino.dart';

import '../../../../base_classes/base_state.dart';

@immutable
abstract class InAppPurchaseState extends BaseState {
  final String? error;
  final List<String> products;

  InAppPurchaseState(this.error, this.products);
}

@immutable
class InAppPurchasedState extends InAppPurchaseState {
  final bool isSubscriptionPurchased;

  InAppPurchasedState(
      super.error, super.products, this.isSubscriptionPurchased);
}

@immutable
class InAppRestoredState extends InAppPurchaseState {
  final bool isSubcriptionRestored;

  InAppRestoredState(super.error, super.products, this.isSubcriptionRestored);
}

@immutable
class InAppNotFoundState extends InAppPurchaseState {
  InAppNotFoundState(super.error, super.products);
}

@immutable
class InAppPurchaseLoadingState extends InAppPurchaseState {
  InAppPurchaseLoadingState(super.error, super.products);
}
