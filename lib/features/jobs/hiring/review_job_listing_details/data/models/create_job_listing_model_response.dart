import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_job_listing_model_response.freezed.dart';
part 'create_job_listing_model_response.g.dart';

@freezed
class CreateJobListingModelResponse with _$CreateJobListingModelResponse {
  const factory CreateJobListingModelResponse({
    required String title,
    required String description,
    required String status,
    String? startDate,
    String? endDate,
    String? startTime,
    required String estimatedHours,
    required double lat,
    required double lng,
    required String images,
    required String skills,
    String? id,
    required double distance,
  }) = _CreateJobListingModelResponse;

  factory CreateJobListingModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$CreateJobListingModelResponseFromJson(json);
}
