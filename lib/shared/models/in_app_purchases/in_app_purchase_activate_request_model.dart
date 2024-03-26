import 'package:freezed_annotation/freezed_annotation.dart';

part 'in_app_purchase_activate_request_model.freezed.dart';
part 'in_app_purchase_activate_request_model.g.dart';

@freezed
class InAppPurchaseActivationRequestModel with _$InAppPurchaseActivationRequestModel {
  factory InAppPurchaseActivationRequestModel({
    @JsonKey(name: 'userIdentifier') required String userIdentifier,
    @JsonKey(name: 'productIdentifier') required String productIdentifier,
    required String skin,
    @JsonKey(name: 'transactionID') required String transactionID,
    @JsonKey(name: 'verificationData') required String verificationData,
  }) = _InAppPurchaseActivationRequestModel;

  factory InAppPurchaseActivationRequestModel.fromJson(Map<String, dynamic> json) => _$InAppPurchaseActivationRequestModelFromJson(json);
}
