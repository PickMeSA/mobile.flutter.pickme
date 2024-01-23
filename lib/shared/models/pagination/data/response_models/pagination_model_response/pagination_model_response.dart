import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_model_response.freezed.dart';
part 'pagination_model_response.g.dart';

@freezed
class PaginationModelResponse with _$PaginationModelResponse {
  const factory PaginationModelResponse({
    required int pageSize,
    required int pageNumber,
    required int total,
    required int totalPages,
    int? next_page,
    int? prev_page,
    String? searchTerm,
  }) = _PaginationModelResponse;

  factory PaginationModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$PaginationModelResponseFromJson(json);
}
