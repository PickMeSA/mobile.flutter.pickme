import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickme/features/rate_and_work_times/data/response_models/rate_and_work_times_model_response/work_days_model_response.dart';

part 'work_days_list_model_response.freezed.dart';
part 'work_days_list_model_response.g.dart';

@freezed
class WorkDaysListModelResponse with _$WorkDaysListModelResponse {
  const factory WorkDaysListModelResponse({
    required List<WorkDaysModelResponse>? workDays,
  }) = _WorkDaysListModelResponse;

  factory WorkDaysListModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$WorkDaysListModelResponseFromJson(json);
}
