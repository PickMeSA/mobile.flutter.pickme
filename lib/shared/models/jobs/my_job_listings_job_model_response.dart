import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickme/features/jobs/shared/features/skills/data/models/skills_model_response.dart';

part 'my_job_listings_job_model_response.freezed.dart';
part 'my_job_listings_job_model_response.g.dart';

@freezed
class MyJobListingsJobModelResponse with _$MyJobListingsJobModelResponse {
  const factory MyJobListingsJobModelResponse({
    String? title,
    String? description,
    String? status,
    String? address,
    String? startDate,
    String? endDate,
    String? startTime,
    double? estimatedHours,
    double? lat,
    double? lng,
    String? images,
    List<SkillsModelResponse>? skills,
    String? id,
    String? employerName,
    double? distance,
  }) = _MyJobListingsJobModelResponse;

  factory MyJobListingsJobModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$MyJobListingsJobModelResponseFromJson(json);
}
