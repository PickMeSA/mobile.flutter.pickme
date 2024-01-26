import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_customer_model_response.freezed.dart';
part 'job_customer_model_response.g.dart';

@freezed
class JobCustomerModelResponse with _$JobCustomerModelResponse {
  const factory JobCustomerModelResponse({
  String? id,
  String? firstName,
  String? surname,
  int? averageRating,
  String? profileImage,
  String? address,
  }) = _JobCustomerModelResponse;

  factory JobCustomerModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$JobCustomerModelResponseFromJson(json);
}
