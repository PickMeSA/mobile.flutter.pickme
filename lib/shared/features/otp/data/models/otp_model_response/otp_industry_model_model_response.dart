import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_industry_model_model_response.freezed.dart';
part 'otp_industry_model_model_response.g.dart';

@freezed
class OTPIndustryModelModelResponse with _$OTPIndustryModelModelResponse {
  const factory OTPIndustryModelModelResponse({
    required int? id,
  required String? industry
  }) = _OTPIndustryModelModelResponse;

  factory OTPIndustryModelModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$OTPIndustryModelModelResponseFromJson(json);
}
