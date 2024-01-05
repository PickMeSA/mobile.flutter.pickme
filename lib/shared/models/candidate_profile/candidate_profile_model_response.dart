import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickme/shared/domain/entities/candidate_profile_entity.dart';
import 'package:pickme/shared/models/candidate_profile/work_experience_model_response.dart';

part 'candidate_profile_model_response.freezed.dart';
part 'candidate_profile_model_response.g.dart';

@freezed
class CandidateProfileModelResponse with _$CandidateProfileModelResponse {
  const factory CandidateProfileModelResponse({
    required String id,
    required String name,
    required String job_title,
    required String skills,
    required String about,
    required String photos,
    required List<WorkExperienceModelResponse> workExperience,
    required double hourly_rate,
    required int rating,
    required String? profile_picture,
  }) = _CandidateProfileModelResponse;

  factory CandidateProfileModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$CandidateProfileModelResponseFromJson(json);
}
