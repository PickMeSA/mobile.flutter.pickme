import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'candidate_profile_model_response.freezed.dart';
part 'candidate_profile_model_response.g.dart';

@freezed
class CandidateProfileModelResponse with _$CandidateProfileModelResponse {
  const factory CandidateProfileModelResponse({
    required String id,
    required String name,
    required String job_title,
    required double hourly_rate,
    required int rating,
    required String? profile_picture,
  }) = _CandidateProfileModelResponse;

  factory CandidateProfileModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$CandidateProfileModelResponseFromJson(json);
}
