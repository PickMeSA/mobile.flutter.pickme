import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cancel_booking_model_response.freezed.dart';
part 'cancel_booking_model_response.g.dart';

@freezed
class CancelBookingModelResponse with _$CancelBookingModelResponse {
  const factory CancelBookingModelResponse({
    required String? jobInterestId,
    required String? reasonForChange,
    required String? comments,
  }) = _CancelBookingModelResponse;

  factory CancelBookingModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$CancelBookingModelResponseFromJson(json);
}
