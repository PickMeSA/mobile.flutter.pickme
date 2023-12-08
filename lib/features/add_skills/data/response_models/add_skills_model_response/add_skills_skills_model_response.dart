import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_skills_skills_model_response.freezed.dart';
part 'add_skills_skills_model_response.g.dart';

@freezed
class AddSkillsSkillsModelResponse with _$AddSkillsSkillsModelResponse {
  const factory AddSkillsSkillsModelResponse({
    required String? id,
    required String? skill
  }) = _AddSkillsSkillsModelResponse;

  factory AddSkillsSkillsModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$AddSkillsSkillsModelResponseFromJson(json);
}
