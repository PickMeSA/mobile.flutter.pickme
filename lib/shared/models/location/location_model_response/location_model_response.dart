import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_model_response.freezed.dart';
part 'location_model_response.g.dart';

@freezed
class LocationModelResponse with _$LocationModelResponse {
  const factory LocationModelResponse({
    required double lat,
    required double lng
  }) = _LocationModelResponse;

  factory LocationModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$LocationModelResponseFromJson(json);
}
