import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'skills_model_response.dart';

part 'skills_list_model_response.freezed.dart';
part 'skills_list_model_response.g.dart';

@freezed
class SkillsListModelResponse with _$SkillsListModelResponse {
  const factory SkillsListModelResponse({
    required List<SkillsModelResponse>? data,
    required List<int>? skillIds
  }) = _SkillsListModelResponse;

  factory SkillsListModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$SkillsListModelResponseFromJson(json);
}
