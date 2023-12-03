import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'add_skills_industry_model_response.dart';

part 'add_skills_industry_list_model_response.freezed.dart';
part 'add_skills_industry_list_model_response.g.dart';

@freezed
class AddSkillsIndustryListModelResponse with _$AddSkillsIndustryListModelResponse {
  const factory AddSkillsIndustryListModelResponse({
    required List<AddSkillsIndustryModelResponse> data,
  }) = _AddSkillsIndustryListModelResponse;

  factory AddSkillsIndustryListModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$AddSkillsIndustryListModelResponseFromJson(json);
}
