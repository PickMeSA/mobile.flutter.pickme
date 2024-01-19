import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_work_experience_model_response.freezed.dart';
part 'otp_work_experience_model_response.g.dart';

@freezed
class OTPWorkExperienceModelResponse with _$OTPWorkExperienceModelResponse {
  const factory OTPWorkExperienceModelResponse({
    required String? title,
    required String? company,
    required String? startDate,
    required String? endDate,
    required bool? isCurrent,
    required int? industryId,
    required List<Map<String, dynamic>> files
  }) = _OTPWorkExperienceModelResponse;

  factory OTPWorkExperienceModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$OTPWorkExperienceModelResponseFromJson(json);
}
