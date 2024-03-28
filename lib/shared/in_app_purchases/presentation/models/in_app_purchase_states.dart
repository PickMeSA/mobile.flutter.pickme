part of '../in_app_purchase_bloc.dart';

@immutable
abstract class InAppPurchaseState extends Equatable implements BaseState {
  final String? error;
  final String? product;
  @override
  DataState dataState;

  InAppPurchaseState(this.error, this.product, this.dataState);
}

class InAppPurchasedState extends InAppPurchaseState {
  final bool isSubscriptionPurchased;
  final bool isPurchasedCancelled;
  final InAppPurchaseDetails? purchaseDetails;
  final String? product_;
  final String? error_;

  InAppPurchasedState(this.error_, this.product_, this.isSubscriptionPurchased, this.isPurchasedCancelled, this.purchaseDetails):super(error_, product_, DataState.success);

  @override
  List<Object?> get props => [error, isSubscriptionPurchased, isPurchasedCancelled, purchaseDetails];
}

class InAppRestoredState extends InAppPurchaseState {
  final bool isSubscriptionRestored;
  final InAppPurchaseDetails? purchaseDetails;
  final String? product_;
  final String? error_;

  InAppRestoredState(this.error_, this.product_, this.isSubscriptionRestored, this.purchaseDetails):super(error_, product_, DataState.success);
  @override
  List<Object?> get props => [error, isSubscriptionRestored, purchaseDetails];
}

class InAppNotFoundState extends InAppPurchaseState {
  InAppNotFoundState():super(null, "", DataState.error);

  @override
  List<Object?> get props => [];
}

class InAppPurchaseLoadingState extends InAppPurchaseState {
  InAppPurchaseLoadingState():super(null, "", DataState.loading);

  @override
  List<Object?> get props =>[];
}

class InAppPurchaseActivatedState extends InAppPurchaseState {
  final InAppPurchaseDetails? purchaseDetails;
  final bool isSubscriptionActivated;
  final String? product_;
  final String? error_;
  InAppPurchaseActivatedState(this.error_, this.product_, {
    this.isSubscriptionActivated = false,
    this.purchaseDetails,
  }): assert(isSubscriptionActivated == true || purchaseDetails != null), super(error_, product_,  DataState.success);

  @override
  List<Object?> get props => [error, isSubscriptionActivated, purchaseDetails];
}
class InAppPurchaseRecoverableErrorState extends InAppPurchaseState {
  final InAppPurchaseDetails? purchaseDetails;
  final String? error_;
  InAppPurchaseRecoverableErrorState(this.error_, {
    this.purchaseDetails,
  }): super(error_, null,  DataState.error);

  @override
  List<Object?> get props => [purchaseDetails];
}
