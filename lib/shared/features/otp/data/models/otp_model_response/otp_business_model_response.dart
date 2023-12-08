import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_business_entity.dart';

part 'otp_business_model_response.freezed.dart';
part 'otp_business_model_response.g.dart';

@freezed
class OTPBusinessModelResponse with _$OTPBusinessModelResponse {
  const factory OTPBusinessModelResponse({
    required String? name,
    required String? number,
    required String? cipc,
    required bool? website
  }) = _OTPBusinessModelResponse;

  factory OTPBusinessModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$OTPBusinessModelResponseFromJson(json);

}
