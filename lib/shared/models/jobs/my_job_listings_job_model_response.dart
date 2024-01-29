import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_job_listings_job_model_response.freezed.dart';
part 'my_job_listings_job_model_response.g.dart';

@freezed
class MyJobListingsJobModelResponse with _$MyJobListingsJobModelResponse {
  const factory MyJobListingsJobModelResponse({
    String? title,
    String? description,
    String? status,
    String? startDate,
    String? endDate,
    String? startTime,
    double? estimatedHours,
    double? lat,
    double? lng,
    String? images,
    String? skills,
    String? id,
    double? distance,
    String? address
  }) = _MyJobListingsJobModelResponse;

  factory MyJobListingsJobModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$MyJobListingsJobModelResponseFromJson(json);
}
