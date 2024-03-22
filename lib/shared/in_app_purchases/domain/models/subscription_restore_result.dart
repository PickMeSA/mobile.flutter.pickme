import 'package:flutter/cupertino.dart';
import '../../presentation/models/in_app_purchase_details.dart';

@immutable
class SubscriptionRestoreResult {
  final bool restored;
  final String productId;
  final String? error;
  final InAppPurchaseDetails? purchaseDetails;

  const SubscriptionRestoreResult(this.productId, this.restored,
      {this.error, this.purchaseDetails});

  @override
  String toString() {
    if (error != null) {
      return " ****** Subscription Restore Failed with $error ********";
    }
    return '''
          ****** Subscription Restore result ********
          Paid: $restored
          Products: ${productId[0]}****${productId[productId.length - 1]}
          ''';
  }
}
