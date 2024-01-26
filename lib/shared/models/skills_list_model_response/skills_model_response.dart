import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'skills_model_response.freezed.dart';
part 'skills_model_response.g.dart';

@freezed
class SkillsModelResponse with _$SkillsModelResponse {
  const factory SkillsModelResponse({
    @JsonKey(fromJson: _idFromJson, toJson: _idToJson) required dynamic  id,
    required String? skill
  }) = _SkillsModelResponse;

  factory SkillsModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$SkillsModelResponseFromJson(json);
}
dynamic _idFromJson(dynamic id) {
  if (id is int) {
    return id.toString();
  } else if (id is String) {
    return id.toString() ?? id;
  } else {
    return null;
  }
}
// A custom function that converts the id value to a string
String _idToJson(dynamic id) {
  return id.toString();
}