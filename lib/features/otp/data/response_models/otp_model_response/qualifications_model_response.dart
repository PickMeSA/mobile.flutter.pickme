import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_qualification_model_response_model_response.dart';

part 'qualifications_model_response.freezed.dart';
part 'qualifications_model_response.g.dart';

@freezed
class QualificationsModelResponse with _$QualificationsModelResponse {
  const factory QualificationsModelResponse({
    required OTPQualificationModelResponse qualifications,
  }) = _QualificationsModelResponse;

  factory QualificationsModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$QualificationsModelResponseFromJson(json);
}
