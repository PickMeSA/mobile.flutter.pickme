import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_job_offer_model_request.freezed.dart';
part 'send_job_offer_model_request.g.dart';

@freezed
class SendJobOfferModelRequest with _$SendJobOfferModelRequest {
  const factory SendJobOfferModelRequest({
    required String jobId,
    required String customerUid,
    required String labourerUid,
    required String? startDate,
    required String? endDate,
    required String? startTime,
    required double? estimatedHours,
    required String? comments,
    required String type,
    required String status,
    required String? bookingId
  }) = _SendJobOfferModelRequest;

  factory SendJobOfferModelRequest.fromJson(
          Map<String, Object?> json) =>
      _$SendJobOfferModelRequestFromJson(json);
}
