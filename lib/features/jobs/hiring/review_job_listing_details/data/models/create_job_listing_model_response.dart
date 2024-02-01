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
    @SkillsOrStringConverter() required List<SkillsModelResponse> skills,
    String? id,
    double? distance,
  }) = _CreateJobListingModelResponse;

  factory CreateJobListingModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$CreateJobListingModelResponseFromJson(json);
}
// Custom converter to handle the Skills or String scenario
class SkillsOrStringConverter
    implements JsonConverter<List<SkillsModelResponse>, Object?> {
  const SkillsOrStringConverter();

  @override
  List<SkillsModelResponse> fromJson(Object? json) {
    if (json is List) {
      return json
          .map((dynamic e) => SkillsModelResponse.fromJson(
          e as Map<String, dynamic>))
          .toList();
    } else if (json is String) {
      // If the value is a string, treat it as an empty list
      return [];
    } else {
      throw ArgumentError('Invalid value for SkillsModelResponse');
    }
  }

  @override
  Object? toJson(List<SkillsModelResponse> skills) =>
      skills.map((e) => e.toJson()).toList();
}