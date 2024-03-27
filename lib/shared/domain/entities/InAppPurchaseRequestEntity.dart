import 'package:equatable/equatable.dart';

import '../../models/in_app_purchases/in_app_purchase_activate_request_model.dart';

class InAppPurchaseActivationRequestEntity extends Equatable{
  final String userIdentifier;
  final String productIdentifier;
  final String skin;
  final String transactionID;
  final String verificationData;

  const InAppPurchaseActivationRequestEntity({
    required this.userIdentifier,
    required this.productIdentifier,
    required this.skin,
    required this.transactionID,
    required this.verificationData,
  });

  factory InAppPurchaseActivationRequestEntity.fromModel(InAppPurchaseActivationRequestModel model) {
    return InAppPurchaseActivationRequestEntity(
      userIdentifier: model.userIdentifier,
      productIdentifier: model.productIdentifier,
      skin: model.skin,
      transactionID: model.transactionID,
      verificationData: model.verificationData,
    );
  }

  InAppPurchaseActivationRequestModel toModel() {
    return InAppPurchaseActivationRequestModel(
      userIdentifier: userIdentifier,
      productIdentifier: productIdentifier,
      skin: skin,
      transactionID: transactionID,
      verificationData: verificationData,
    );
  }

  @override
  List<Object?> get props => [
    userIdentifier,
    productIdentifier,
    skin,
    transactionID,
    verificationData,
  ];

}
