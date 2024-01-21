import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_work_experience_model_response.dart';

import '../../../../rate_and_work_times/data/response_models/rate_and_work_times_model_response/submit_remote_rate_and_work_times_model_response.dart';

part 'work_times_model_response.freezed.dart';
part 'work_times_model_response.g.dart';

@freezed
class WorkTimesModelResponse with _$WorkTimesModelResponse {
  const factory WorkTimesModelResponse({
    required String? startTime,
    required String? endTime,
    required List<String>? workingDays
  }) = _WorkTimesModelResponse;

  factory WorkTimesModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$WorkTimesModelResponseFromJson(json);
}
