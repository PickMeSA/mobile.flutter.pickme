import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_skills_skills_page_model_response.freezed.dart';
part 'add_skills_skills_page_model_response.g.dart';

@freezed
class AddSkillsSkillsPageModelResponse with _$AddSkillsSkillsPageModelResponse {
  const factory AddSkillsSkillsPageModelResponse({
    required String? name,
  }) = _AddSkillsSkillsPageModelResponse;

  factory AddSkillsSkillsPageModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$AddSkillsSkillsPageModelResponseFromJson(json);
}
