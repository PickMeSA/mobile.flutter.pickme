import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_experience_model_response.freezed.dart';
part 'work_experience_model_response.g.dart';

@freezed
class WorkExperienceModelResponse with _$WorkExperienceModelResponse {
  const factory WorkExperienceModelResponse({
    required String? name,
  }) = _WorkExperienceModelResponse;

  factory WorkExperienceModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$WorkExperienceModelResponseFromJson(json);
}
