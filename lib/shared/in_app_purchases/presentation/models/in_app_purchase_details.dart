import 'package:flutter/cupertino.dart';

@immutable
class InAppPurchaseDetails {
  final String verificationData;
  final String? purchaseID;
  const InAppPurchaseDetails(
      this.verificationData, this.purchaseID);
}