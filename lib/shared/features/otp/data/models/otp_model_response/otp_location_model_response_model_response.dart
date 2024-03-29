import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_location_model_response_model_response.freezed.dart';
part 'otp_location_model_response_model_response.g.dart';

@freezed
class OTPLocationModelResponse with _$OTPLocationModelResponse {
  const factory OTPLocationModelResponse({

    required double? latitude,
    required double? longitude,
    required String? address
  }) = _OTPLocationModelResponse;

  factory OTPLocationModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$OTPLocationModelResponseFromJson(json);
}
