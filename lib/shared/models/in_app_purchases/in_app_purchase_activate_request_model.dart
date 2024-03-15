import 'package:freezed_annotation/freezed_annotation.dart';

part 'in_app_purchase_activate_request_model.freezed.dart';
part 'in_app_purchase_activate_request_model.g.dart';

@freezed
class InAppPurchaseActivationRequestModel with _$InAppPurchaseActivationRequestModel {
  factory InAppPurchaseActivationRequestModel({
    @JsonKey(name: 'user_identifier') required String userIdentifier,
    @JsonKey(name: 'product_identifier') required String productIdentifier,
    required String skin,
    @JsonKey(name: 'receipt_number') required String receiptNumber,
    @JsonKey(name: 'icloud_identifier') required String icloudIdentifier,
  }) = _InAppPurchaseActivationRequestModel;

  factory InAppPurchaseActivationRequestModel.fromJson(Map<String, dynamic> json) => _$InAppPurchaseActivationRequestModelFromJson(json);
}
