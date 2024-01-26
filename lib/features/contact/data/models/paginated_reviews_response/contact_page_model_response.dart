import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickme/features/my_reviews/data/models/review_response_model/review_response_model.dart';
import 'package:pickme/shared/models/pagination/data/response_models/pagination_model_response/pagination_model_response.dart';

part 'contact_page_model_response.freezed.dart';
part 'contact_page_model_response.g.dart';

@freezed
class ContactModelResponse with _$ContactModelResponse {
  const factory ContactModelResponse({
    required List<ReviewModelResponse> data,
    required PaginationModelResponse pagination,
  }) = _ContactModelResponse;

  factory ContactModelResponse.fromJson(
      Map<String, Object?> json) =>
      _$ContactModelResponseFromJson(json);
}