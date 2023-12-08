import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'add_skills_skills_model_response.dart';

part 'add_skills_skills_list_model_response.freezed.dart';
part 'add_skills_skills_list_model_response.g.dart';

@freezed
class AddSkillsSkillsListModelResponse with _$AddSkillsSkillsListModelResponse {
  const factory AddSkillsSkillsListModelResponse({
    required List<AddSkillsSkillsModelResponse>? data,
    required List<int>? skillIds
  }) = _AddSkillsSkillsListModelResponse;

  factory AddSkillsSkillsListModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$AddSkillsSkillsListModelResponseFromJson(json);
}
