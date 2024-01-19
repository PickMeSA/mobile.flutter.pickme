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
    required String userId,
    required String firstName,
    required String surname,
    String? jobTitle,
    String? skills,
    String? description,
    String? photos,
    List<WorkExperienceModelResponse>? workExperience,
    double? hourlyRate,
    int? rating,
    String? profilePictureUrl,
  }) = _CandidateProfileModelResponse;

  factory CandidateProfileModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$CandidateProfileModelResponseFromJson(json);
}
