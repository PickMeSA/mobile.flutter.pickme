import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickme/shared/domain/entities/candidate_profile_entity.dart';

part 'work_experience_model_response.freezed.dart';
part 'work_experience_model_response.g.dart';

@freezed
class WorkExperienceModelResponse with _$WorkExperienceModelResponse {
  const factory WorkExperienceModelResponse({
    required String role,
    required String company,
    required String period,
  }) = _WorkExperienceModelResponse;

  factory WorkExperienceModelResponse.fromJson(
      Map<String, Object?> json) =>
      _$WorkExperienceModelResponseFromJson(json);
}
