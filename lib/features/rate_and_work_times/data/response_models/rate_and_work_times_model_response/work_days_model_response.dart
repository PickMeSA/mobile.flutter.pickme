import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_days_model_response.freezed.dart';
part 'work_days_model_response.g.dart';

@freezed
class WorkDaysModelResponse with _$WorkDaysModelResponse {
  const factory WorkDaysModelResponse({
    required String? id,
    required String? day
  }) = _WorkDaysModelResponse;

  factory WorkDaysModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$WorkDaysModelResponseFromJson(json);
}
