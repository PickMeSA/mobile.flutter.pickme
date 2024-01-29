import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickme/shared/models/job_customer_model_response/job_customer_model_response.dart';

import 'job_data_model_response.dart';

part 'job_offer_model_response.freezed.dart';
part 'job_offer_model_response.g.dart';

@freezed
class JobOfferModel with _$JobOfferModel {
  const factory JobOfferModel({
    required String id,
    required String jobId,
    required String customerUid,
    required String labourerUid,
    @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson) dynamic startDate,
    @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson) dynamic endDate,
    required String startTime,
    required double estimatedHours,
    String? comments,
    required String type,
    required String status,
    String? reasonForChange,
    @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson) dynamic proposedAltStartDate,
    @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson) dynamic proposedAltEndDate,
    String? proposedAltStartTime,
    String? proposerUid,
    required JobCustomerModelResponse customer,
    required JobDataModel job,
  }) = _JobOfferModel;

  factory JobOfferModel.fromJson(Map<String, dynamic> json) =>
      _$JobOfferModelFromJson(json);
}


DateTime? _dateTimeFromJson(String? value) =>
    value != null && value.isNotEmpty ? DateTime.parse(value) : null;

String? _dateTimeToJson(DateTime? value) =>
    value != null ? value.toIso8601String() : null;