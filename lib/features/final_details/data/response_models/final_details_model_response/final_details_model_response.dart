import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'final_details_model_response.freezed.dart';
part 'final_details_model_response.g.dart';

@freezed
class FinalDetailsModelResponse with _$FinalDetailsModelResponse {
  const factory FinalDetailsModelResponse({
    required String? description,
    required int? profilePictureId,
    required int? policeClearanceId
  }) = _FinalDetailsModelResponse;

  factory FinalDetailsModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$FinalDetailsModelResponseFromJson(json);
}
