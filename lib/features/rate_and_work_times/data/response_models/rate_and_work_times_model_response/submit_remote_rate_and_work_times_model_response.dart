import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickme/features/rate_and_work_times/data/response_models/rate_and_work_times_model_response/work_days_list_model_response.dart';

part 'submit_remote_rate_and_work_times_model_response.freezed.dart';
part 'submit_remote_rate_and_work_times_model_response.g.dart';

@freezed
class SubmitRemoteRateAndWorkTimesModelResponse with _$SubmitRemoteRateAndWorkTimesModelResponse {
  const factory SubmitRemoteRateAndWorkTimesModelResponse({
    required String? hourlyRate,
    required String? startTime,
    required String? endTime,
    required WorkDaysListModelResponse? workDays
  }) = _SubmitRemoteRateAndWorkTimesModelResponse;

  factory SubmitRemoteRateAndWorkTimesModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$SubmitRemoteRateAndWorkTimesModelResponseFromJson(json);
}
