import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'date_and_time_model_response.freezed.dart';
part 'date_and_time_model_response.g.dart';

@freezed
class DateAndTimeModelResponse with _$DateAndTimeModelResponse {
  const factory DateAndTimeModelResponse({
    required DateTime? startDate,
    required DateTime? endDate,
    required String? startTime,
    required String? comments
  }) = _DateAndTimeModelResponse;

  factory DateAndTimeModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$DateAndTimeModelResponseFromJson(json);
}
