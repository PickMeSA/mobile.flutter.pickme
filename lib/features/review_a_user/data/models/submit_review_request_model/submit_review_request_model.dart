import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickme/features/add_skills/data/response_models/add_skills_model_response/add_skills_industry_model_response.dart';

part 'submit_review_request_model.freezed.dart';
part 'submit_review_request_model.g.dart';

@freezed
class SubmitReviewRequestModel with _$SubmitReviewRequestModel {
  const factory SubmitReviewRequestModel({
    required int rating,
    required String review,
    required String reviewerId,
    required String userId,
  }) = _SubmitReviewRequestModel;

  factory SubmitReviewRequestModel.fromJson(
      Map<String, Object?> json) =>
      _$SubmitReviewRequestModelFromJson(json);
}
