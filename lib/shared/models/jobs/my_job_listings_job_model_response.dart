import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_job_listings_job_model_response.freezed.dart';
part 'my_job_listings_job_model_response.g.dart';

@freezed
class MyJobListingsJobModelResponse with _$MyJobListingsJobModelResponse {
  const factory MyJobListingsJobModelResponse({
    required String title,
    required String description,
    required String status,
    String? startDate,
    String? endDate,
    String? startTime,
    required double estimatedHours,
    required double lat,
    required double lng,
    required String images,
    required String skills,
    String? id,
    double? distance,
  }) = _MyJobListingsJobModelResponse;

  factory MyJobListingsJobModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$MyJobListingsJobModelResponseFromJson(json);
}
