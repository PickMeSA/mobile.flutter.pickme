import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'industries_model_response.freezed.dart';
part 'industries_model_response.g.dart';

@freezed
class IndustriesModelResponse with _$IndustriesModelResponse {
  factory IndustriesModelResponse({
    @JsonKey(fromJson: _idFromJson, toJson: _idToJson) required dynamic id,
    required String? industry,
  }) = _IndustriesModelResponse;

  factory IndustriesModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$IndustriesModelResponseFromJson(json);
}
int? _idFromJson(dynamic id) {
  if (id is int) {
    return id;
  } else if (id is String) {
    return int.tryParse(id);
  } else {
    return null;
  }
}

String _idToJson(dynamic id) {
  return id.toString();
}