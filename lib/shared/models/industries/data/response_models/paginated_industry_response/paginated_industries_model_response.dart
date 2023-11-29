import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickme/shared/models/pagination/data/response_models/pagination_model_response/pagination_model_response.dart';

import '../industries_model_response/industries_model_response.dart';

part 'paginated_industries_model_response.freezed.dart';
part 'paginated_industries_model_response.g.dart';

@freezed
class PaginatedIndustriesModelResponse with _$PaginatedIndustriesModelResponse {
  const factory PaginatedIndustriesModelResponse({
    required List<IndustriesModelResponse> data,
    required PaginationModelResponse pagination,
  }) = _PaginatedIndustriesModelResponse;

  factory PaginatedIndustriesModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$PaginatedIndustriesModelResponseFromJson(json);
}
