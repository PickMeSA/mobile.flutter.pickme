import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickme/shared/models/skills_list_model_response/skills_model_response.dart';

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
    double? estimatedHours,
    double? lat,
    double? lng,
    String? images,
    required List<SkillsModelResponse> skills,
    String? id,
    double? distance,
  }) = _CreateJobListingModelResponse;

  factory CreateJobListingModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$CreateJobListingModelResponseFromJson(json);
}
