import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickme/features/my_reviews/data/models/review_response_model/review_response_model.dart';
import 'package:pickme/shared/models/pagination/data/response_models/pagination_model_response/pagination_model_response.dart';

part 'my_reviews_page_model_response.freezed.dart';
part 'my_reviews_page_model_response.g.dart';

@freezed
class MyReviewsModelResponse with _$MyReviewsModelResponse {
  const factory MyReviewsModelResponse({
    required List<ReviewModelResponse> data,
    required PaginationModelResponse pagination,
  }) = _MyReviewsModelResponse;

  factory MyReviewsModelResponse.fromJson(
      Map<String, Object?> json) =>
      _$MyReviewsModelResponseFromJson(json);
}