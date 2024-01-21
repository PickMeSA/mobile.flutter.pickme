import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'propose_alternative_model_response.freezed.dart';
part 'propose_alternative_model_response.g.dart';

@freezed
class ProposeAlternativeModelResponse with _$ProposeAlternativeModelResponse {
  const factory ProposeAlternativeModelResponse({
    required String? name,
  }) = _ProposeAlternativeModelResponse;

  factory ProposeAlternativeModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$ProposeAlternativeModelResponseFromJson(json);
}
