import 'package:equatable/equatable.dart';

import '../../models/in_app_purchases/in_app_purchase_activate_request_model.dart';

class InAppPurchaseActivationRequestEntity extends Equatable{
  final String userIdentifier;
  final String productIdentifier;
  final String skin;
  final String receiptNumber;
  final String icloudIdentifier;

  const InAppPurchaseActivationRequestEntity({
    required this.userIdentifier,
    required this.productIdentifier,
    required this.skin,
    required this.receiptNumber,
    required this.icloudIdentifier,
  });

  factory InAppPurchaseActivationRequestEntity.fromModel(InAppPurchaseActivationRequestModel model) {
    return InAppPurchaseActivationRequestEntity(
      userIdentifier: model.userIdentifier,
      productIdentifier: model.productIdentifier,
      skin: model.skin,
      receiptNumber: model.receiptNumber,
      icloudIdentifier: model.icloudIdentifier,
    );
  }

  InAppPurchaseActivationRequestModel toModel() {
    return InAppPurchaseActivationRequestModel(
      userIdentifier: userIdentifier,
      productIdentifier: productIdentifier,
      skin: skin,
      receiptNumber: receiptNumber,
      icloudIdentifier: icloudIdentifier,
    );
  }

  @override
  List<Object?> get props => [
    userIdentifier,
    productIdentifier,
    skin,
    receiptNumber,
    icloudIdentifier,
  ];

}
