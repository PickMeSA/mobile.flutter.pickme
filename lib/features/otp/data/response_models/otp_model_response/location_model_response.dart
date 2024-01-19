import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_location_model_response_model_response.dart';

part 'location_model_response.freezed.dart';
part 'location_model_response.g.dart';

@freezed
class LocationModelResponse with _$LocationModelResponse {
  const factory LocationModelResponse({
    required OTPLocationModelResponse location,
  }) = _LocationModelResponse;

  factory LocationModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$LocationModelResponseFromJson(json);
}
