import 'package:flutter/cupertino.dart';
import 'package:pickme/shared/in_app_purchases/presentation/models/in_app_purchase_details.dart';

@immutable
class SubscriptionPaymentResult {
  final bool purchased;
  final bool cancelled;
  final String productId;
  final String? error;
  final InAppPurchaseDetails? purchaseDetails;

  const SubscriptionPaymentResult(
      this.purchased, this.productId, this.cancelled,
      {this.error, this.purchaseDetails});

  @override
  String toString() {
    if (error != null) {
      return " ****** Subscription Restore Failed with $error ********";
    }
    return '''
          ******* Subscription Purchase Result ********** 
          Paid: $purchased
          Cancelled: $cancelled
          Products: ${productId[0]}****${productId[productId.length - 1]}
          ''';
  }
}
