import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickme/features/add_skills/data/response_models/add_skills_model_response/add_skills_industry_model_response.dart';

part 'reviewer_response_model.freezed.dart';
part 'reviewer_response_model.g.dart';

@freezed
class ReviewerModelResponse with _$ReviewerModelResponse {
  const factory ReviewerModelResponse({
    required String reviewerId,
    required String firstName,
    required String surname,
    required String? profilePictureUrl,
    required AddSkillsIndustryModelResponse industry,
  }) = _ReviewerModelResponse;

  factory ReviewerModelResponse.fromJson(
      Map<String, Object?> json) =>
      _$ReviewerModelResponseFromJson(json);
}
