import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickme/shared/models/jobs/my_job_listings_job_model_response.dart';

import 'customer_model_response.dart';

part 'booking_model_response.freezed.dart';
part 'booking_model_response.g.dart';

@freezed
class BookingsModelResponse with _$BookingsModelResponse {
  const factory BookingsModelResponse({
    required String? startTime,
    required String? previousStatus,
    required String? name,
    required String? id,
    required String? endDate,
    required String? startDate,
    required String? type,
    required String? applied,
    required String? bookingId,
    required String? comments,
    required String? customerUid,
    required int? estimatedHours,
    required String? labourerUid,
    required String? jobId,
    required String? status,
    required String? reasonForChange,
    required String? proposedAltStartDate,
    required String? proposedAltEndDate,
    required String? proposedAltStartTime,
    required String? proposerUid,
  required MyJobListingsJobModelResponse? job,
    required CustomerModelResponse? customer
  }) = _BookingaModelResponse;

  factory BookingsModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$BookingsModelResponseFromJson(json);
}
