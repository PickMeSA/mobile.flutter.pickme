import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_final_details_model_response.freezed.dart';
part 'submit_final_details_model_response.g.dart';

@freezed
class SubmittedFinalDetailsModelResponse with _$SubmittedFinalDetailsModelResponse {
  const factory SubmittedFinalDetailsModelResponse({
    final String? profilePicture,
    final String? policeClearance,
    final String? description,
    final int? policeClearanceId,
    final int? profilePictureId
  }) = _SubmittedFinalDetailsModelResponse;

  factory SubmittedFinalDetailsModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$SubmittedFinalDetailsModelResponseFromJson(json);
}
