import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'industries_model_response.freezed.dart';
part 'industries_model_response.g.dart';

@freezed
class IndustriesModelResponse with _$IndustriesModelResponse {
  const factory IndustriesModelResponse({
    required String id,
    required String industry,
  }) = _IndustriesModelResponse;

  factory IndustriesModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$IndustriesModelResponseFromJson(json);
}
