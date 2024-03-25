part of '../in_app_purchase_bloc.dart';

@immutable
abstract class InAppPurchaseEvent extends BaseEvent implements Equatable {
  final String? userId;

  InAppPurchaseEvent({this.userId});

  @override
  bool? get stringify => false;

  @override
  List<Object?> get props => [userId];

}
// Handle the event when a user wants to buy a subscription
class CreateSubscriptionEvent extends InAppPurchaseEvent {

  CreateSubscriptionEvent({super.userId});

  @override
  String getEventName() => 'create_subscription';
}
// Handle the event when a user wants to restore a subscription
class RestoreSubscriptionEvent extends InAppPurchaseEvent {

  RestoreSubscriptionEvent({super.userId});

  @override
  String getEventName() => 'restore_subscription';
}

class SubscriptionFound extends InAppPurchaseEvent {
  final String subscribedProductId;

  SubscriptionFound({super.userId, required this.subscribedProductId});

  @override
  List<Object?> get props => super.props + [subscribedProductId];

  @override
  String getEventName() => 'subscription_found';
}

class SubscriptionNotFound extends InAppPurchaseEvent implements Equatable  {
  SubscriptionNotFound({super.userId});


  @override
  String getEventName() => 'subscription_not_found';
}

class SubscriptionRestored extends InAppPurchaseEvent {
  final String restoredProductId;

  SubscriptionRestored({super.userId, required this.restoredProductId});

  @override
  List<Object?> get props =>  super.props + [restoredProductId];

  @override
  String getEventName() => 'subscription_restored';
}
class ActivatePurchaseEvent extends InAppPurchaseEvent {
  final InAppPurchaseDetails purchaseDetails;
  ActivatePurchaseEvent(this.purchaseDetails);
}