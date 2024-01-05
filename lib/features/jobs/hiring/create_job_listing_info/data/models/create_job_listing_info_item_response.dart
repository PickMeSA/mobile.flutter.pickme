import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_job_listing_info_item_response.freezed.dart';
part 'create_job_listing_info_item_response.g.dart';

@freezed
class CreateJobListingInfoItemModelResponse with _$CreateJobListingInfoItemModelResponse {
  const factory CreateJobListingInfoItemModelResponse({
    required String title,
    required String description,
  }) = _CreateJobListingInfoItemModelResponse;

  factory CreateJobListingInfoItemModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$CreateJobListingInfoItemModelResponseFromJson(json);
}
