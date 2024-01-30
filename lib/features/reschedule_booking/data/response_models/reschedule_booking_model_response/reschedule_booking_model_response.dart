import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reschedule_booking_model_response.freezed.dart';
part 'reschedule_booking_model_response.g.dart';

@freezed
class RescheduleBookingModelResponse with _$RescheduleBookingModelResponse {
  const factory RescheduleBookingModelResponse({
    String? proposerUid,
    String? startDate,
    String? startTime,
    String? status,
    String? reasonForChange,
    String? comments,
  }) = _RescheduleBookingModelResponse;

  factory RescheduleBookingModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$RescheduleBookingModelResponseFromJson(json);
}
