import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'create_job_listing_info_item_response.dart';

part 'create_job_listing_info_model_response.freezed.dart';
part 'create_job_listing_info_model_response.g.dart';

@freezed
class CreateJobListingInfoModelResponse with _$CreateJobListingInfoModelResponse {
  const factory CreateJobListingInfoModelResponse({
    required String description,
    required List<CreateJobListingInfoItemModelResponse> information,
  }) = _CreateJobListingInfoModelResponse;

  factory CreateJobListingInfoModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$CreateJobListingInfoModelResponseFromJson(json);
}
