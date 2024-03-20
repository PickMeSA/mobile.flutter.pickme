import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../../../base_classes/base_event.dart';


@immutable
abstract class InAppPurchaseEvent extends Equatable implements BaseEvent {
  final String? userId;

  const InAppPurchaseEvent({this.userId});

  @override
  bool? get stringify => false;

  @override
  List<Object?> get props => [userId];

}
// Handle the event when a user wants to buy a subscription
class CreateSubscriptionEvent extends InAppPurchaseEvent {

  const CreateSubscriptionEvent({super.userId});

  @override
  String getEventName() => 'create_subscription';
}
// Handle the event when a user wants to restore a subscription
class RestoreSubscriptionEvent extends InAppPurchaseEvent {

  const RestoreSubscriptionEvent({super.userId});

  @override
  String getEventName() => 'restore_subscription';
}

class SubscriptionFound extends InAppPurchaseEvent {
  final String subscribedProductId;

  const SubscriptionFound({super.userId, required this.subscribedProductId});

  @override
  List<Object?> get props => super.props + [subscribedProductId];

  @override
  String getEventName() => 'subscription_found';
}

class SubscriptionNotFound extends InAppPurchaseEvent implements Equatable  {
  const SubscriptionNotFound({super.userId});


  @override
  String getEventName() => 'subscription_not_found';
}

class SubscriptionRestored extends InAppPurchaseEvent {
  final String restoredProductId;

  const SubscriptionRestored({super.userId, required this.restoredProductId});

  @override
  List<Object?> get props =>  super.props + [restoredProductId];

  @override
  String getEventName() => 'subscription_restored';
}