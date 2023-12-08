import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_skill_id_model_response.freezed.dart';
part 'otp_skill_id_model_response.g.dart';

@freezed
class SkillIdModelResponse with _$SkillIdModelResponse {
  const factory SkillIdModelResponse({
    required List<int> skillsId ,
  }) = _SkillIdModelResponse;

  factory SkillIdModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$SkillIdModelResponseFromJson(json);
}
