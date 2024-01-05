import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'skills_model_response.freezed.dart';
part 'skills_model_response.g.dart';

@freezed
class SkillsModelResponse with _$SkillsModelResponse {
  const factory SkillsModelResponse({
    required String? id,
    required String? skill
  }) = _SkillsModelResponse;

  factory SkillsModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$SkillsModelResponseFromJson(json);
}
