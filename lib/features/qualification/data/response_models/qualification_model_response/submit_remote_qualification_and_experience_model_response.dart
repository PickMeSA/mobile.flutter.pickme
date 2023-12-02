import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_qualification_model_response_model_response.dart';
import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_work_experience_model_response.dart';

part 'submit_remote_qualification_and_experience_model_response.freezed.dart';
part 'submit_remote_qualification_and_experience_model_response.g.dart';

@freezed
class SubmitRemoteQualificationAndExperienceModelResponse with _$SubmitRemoteQualificationAndExperienceModelResponse {
  const factory SubmitRemoteQualificationAndExperienceModelResponse({
    required List<OTPQualificationModelResponse>? otpQualificationResponseModelList,
    required List<OTPWorkExperienceModelResponse> otpWorKExperienceResponseModelList
  }) = _SubmitRemoteQualificationAndExperienceModelResponse;

  factory SubmitRemoteQualificationAndExperienceModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$SubmitRemoteQualificationAndExperienceModelResponseFromJson(json);
}
