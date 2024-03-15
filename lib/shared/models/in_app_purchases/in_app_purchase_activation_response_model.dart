import 'package:freezed_annotation/freezed_annotation.dart';

import '../error/http_error_model.dart';

part 'in_app_purchase_activation_response_model.freezed.dart';
part 'in_app_purchase_activation_response_model.g.dart';

@freezed
abstract class InAppPurchaseActivationResponseModel with _$InAppPurchaseActivationResponseModel {
  const factory InAppPurchaseActivationResponseModel({
    required bool activated,
    HttpErrorModel? httpErrorModel,
  }) = _InAppPurchaseActivationResponseModel;

  factory InAppPurchaseActivationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$InAppPurchaseActivationResponseModelFromJson(json);
}