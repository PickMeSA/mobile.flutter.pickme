import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../../../base_classes/base_event.dart';


@immutable
abstract class InAppPurchaseEvent extends BaseEvent  implements Equatable {
  final String userId;

  InAppPurchaseEvent(this.userId);

  @override
  bool? get stringify => false;
}

class SubscriptionFound extends InAppPurchaseEvent implements Equatable {
  final String subscribedProductId;

  SubscriptionFound(super.userId, this.subscribedProductId);

  @override
  List<Object?> get props => [userId, subscribedProductId];
}

class SubscriptionNotFound extends InAppPurchaseEvent implements Equatable  {
  SubscriptionNotFound(super.userId);

  @override
  List<Object?> get props => [];
}

class SubscriptionRestored extends InAppPurchaseEvent {
  final String restoredProductId;

  SubscriptionRestored(super.userId, this.restoredProductId);

  @override
  List<Object?> get props => [userId, restoredProductId];
}