import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickme/features/my_reviews/data/models/review_user_response_model/review_user_response_model.dart';
import 'package:pickme/features/my_reviews/data/models/reviewer_response_model/reviewer_response_model.dart';

part 'review_response_model.freezed.dart';
part 'review_response_model.g.dart';

@freezed
class ReviewModelResponse with _$ReviewModelResponse {
  const factory ReviewModelResponse({
    required String id,
    required int rating,
    required String review,
    required DateTime createdAt,
    required DateTime updatedAt,
    required ReviewerModelResponse reviewer,
    required ReviewUserModelResponse user,
  }) = _ReviewModelResponse;

  factory ReviewModelResponse.fromJson(
      Map<String, Object?> json) =>
      _$ReviewModelResponseFromJson(json);
}
