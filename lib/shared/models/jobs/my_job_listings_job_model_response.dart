import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickme/shared/features/otp/data/models/otp_model_response/profile_data_model_response.dart';
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
    String? jobInterestStatus,
    String? jobInterestId,
    double? distance,
    int? jobApplicationsCount,
    int? possibleApplicantMatchesCount,
    List<JobInterestModel>? applications,
    List<JobInterestModel>? potentialMatches,
    String? potentialMatchesRemoved,
  }) = _MyJobListingsJobModelResponse;

  factory MyJobListingsJobModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$MyJobListingsJobModelResponseFromJson(json);
}

@freezed
class JobInterestModel with _$JobInterestModel {
  factory JobInterestModel({
    required Applicant applicant,
    String? jobInterestId,
  }) = _JobInterestModel;

  factory JobInterestModel.fromJson(Map<String, dynamic> json) =>
      _$JobInterestModelFromJson(json);
}

@freezed
class Applicant with _$Applicant {
  factory Applicant({
    required String userId,
    required String firstName,
    required String surname,
    required String profileImage,
    required int averageRating,
    required String address,
    required double hourlyRate,
    required String jobTitle,
  }) = _Applicant;

  factory Applicant.fromJson(Map<String, dynamic> json) =>
      _$ApplicantFromJson(json);
}