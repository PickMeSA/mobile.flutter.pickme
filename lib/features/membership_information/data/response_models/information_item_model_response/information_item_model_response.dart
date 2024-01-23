import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'information_item_model_response.freezed.dart';
part 'information_item_model_response.g.dart';

@freezed
class InformationItemModelResponse with _$InformationItemModelResponse {
  const factory InformationItemModelResponse({
    required String? title,
    required String? description
  }) = _InformationItemModelResponse;

  factory InformationItemModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$InformationItemModelResponseFromJson(json);
}
