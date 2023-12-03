import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickme/features/add_skills/data/response_models/add_skills_model_response/add_skills_industry_model_response.dart';

part 'add_skills_submit_remote_skills_and_industry_model_response.freezed.dart';
part 'add_skills_submit_remote_skills_and_industry_model_response.g.dart';

@freezed
class AddSkillsSubmitRemoteSkillsAndIndustryModelResponse with _$AddSkillsSubmitRemoteSkillsAndIndustryModelResponse {
  const factory AddSkillsSubmitRemoteSkillsAndIndustryModelResponse({
    required int? industryId ,
    required List<int>? skillIds
  }) = _AddSkillsSubmitRemoteSkillsAndIndustryModelResponse;

  factory AddSkillsSubmitRemoteSkillsAndIndustryModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$AddSkillsSubmitRemoteSkillsAndIndustryModelResponseFromJson(json);
}
