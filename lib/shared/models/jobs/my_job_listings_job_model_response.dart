import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickme/shared/models/skills_list_model_response/skills_model_response.dart';
import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_industry_model_model_response.dart';
import 'package:pickme/shared/models/job_customer_model_response/job_customer_model_response.dart';

part 'my_job_listings_job_model_response.freezed.dart';
part 'my_job_listings_job_model_response.g.dart';

@freezed
class MyJobListingsJobModelResponse with _$MyJobListingsJobModelResponse {
  const factory MyJobListingsJobModelResponse({
    String? title,
    String? description,
    String? status,
    String? address,
    String? startDate,
    String? endDate,
    String? startTime,
    double? estimatedHours,
    double? lat,
    double? lng,
    String? images,
    List<SkillsModelResponse>? skills,
    List<OTPIndustryModelModelResponse>? industries,
    JobCustomerModelResponse? customer,
    String? id,
    String? employerName,
    double? distance,
    String? address
  }) = _MyJobListingsJobModelResponse;

  factory MyJobListingsJobModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$MyJobListingsJobModelResponseFromJson(json);
}
