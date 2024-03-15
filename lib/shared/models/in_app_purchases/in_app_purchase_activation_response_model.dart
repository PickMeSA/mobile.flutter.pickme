import 'package:freezed_annotation/freezed_annotation.dart';

part 'in_app_purchase_activation_response_model.freezed.dart';
part 'in_app_purchase_activation_response_model.g.dart';

@freezed
abstract class InAppPurchaseActivationResponseModel with _$InAppPurchaseActivationResponseModel {
  const factory InAppPurchaseActivationResponseModel({
    required bool activated,
    Error? error,
  }) = _InAppPurchaseActivationResponseModel;

  factory InAppPurchaseActivationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$InAppPurchaseActivationResponseModelFromJson(json);
}

@freezed
abstract class Error with _$Error {
  const factory Error({
    required String message,
    required int code,
  }) = _Error;

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);
}