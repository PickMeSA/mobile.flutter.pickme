import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../../../base_classes/base_event.dart';

@immutable
abstract class InAppPurchaseEvent extends Equatable implements BaseEvent {
  final String userId;

  const InAppPurchaseEvent(this.userId);

  @override
  bool? get stringify => false;

  @override
  List<Object?> get props => [userId];
}

class SubscriptionFound extends InAppPurchaseEvent {
  final String subscribedProductId;

  const SubscriptionFound(super.userId, this.subscribedProductId);

  @override
  List<Object?> get props => super.props + [subscribedProductId];

  @override
  String getEventName() => 'subscription_found';
}

class SubscriptionNotFound extends InAppPurchaseEvent implements Equatable {
  const SubscriptionNotFound(super.userId);

  @override
  String getEventName() => 'subscription_not_found';
}

class SubscriptionRestored extends InAppPurchaseEvent {
  final String restoredProductId;

  const SubscriptionRestored(super.userId, this.restoredProductId);

  @override
  List<Object?> get props => super.props + [restoredProductId];

  @override
  String getEventName() => 'subscription_restored';
}
