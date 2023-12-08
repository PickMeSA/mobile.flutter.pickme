import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_skills_industry_model_response.freezed.dart';
part 'add_skills_industry_model_response.g.dart';

@freezed
class AddSkillsIndustryModelResponse with _$AddSkillsIndustryModelResponse {
  const factory AddSkillsIndustryModelResponse({
    required String? id,
    required String? industry
  }) = _AddSkillsIndustryModelResponse;

  factory AddSkillsIndustryModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$AddSkillsIndustryModelResponseFromJson(json);
}
