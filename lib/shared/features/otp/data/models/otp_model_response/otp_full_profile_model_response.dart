import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickme/features/otp/data/response_models/otp_model_response/work_times_model_response.dart';

import 'otp_business_model_response.dart';
import 'otp_industry_model_model_response.dart';
import 'otp_location_model_response_model_response.dart';
import 'otp_payment_details_model_response.dart';
import 'otp_qualification_model_response_model_response.dart';
import 'otp_skill_id_model_response.dart';
import 'otp_work_experience_model_response.dart';

part 'otp_full_profile_model_response.freezed.dart';
part 'otp_full_profile_model_response.g.dart';

@freezed
class OTPFullProfileModelResponse with _$OTPFullProfileModelResponse {
  const factory OTPFullProfileModelResponse({
    required int? id,
    @JsonKey(fromJson: _idFromJson, toJson: _idToJson) required dynamic  averageRating,
    required String? firstName,
    required String? surname,
    required String? email,
    required String? mobile,
    required String? idNumber,
    required String? workPermit,
    required String? passportNumber,
    required String? type,
    required bool? acceptedTermsAndConditions,
    required int? hourlyRate,
    required String? description,
    required List<SkillIdModelResponse>? skills,
    required WorkTimesModelResponse? workTimes,
    required bool? subscriptionPaid,
    required bool? isActive,
    required int? profilePictureId,
    required int? policeClearanceId,
    required OTPIndustryModelModelResponse? industry,
    required OTPLocationModelResponse? location,
    required List<OTPQualificationModelResponse>? qualifications,
    required List<OTPWorkExperienceModelResponse>? workExperience,
    required OTPPaymentDetailsModelResponse? paymentDetails,
    required OTPBusinessModelResponse? business
  }) = _OTPFullProfileModelResponse;

  factory OTPFullProfileModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$OTPFullProfileModelResponseFromJson(json);
}
dynamic _idFromJson(dynamic id) {
  if (id is int) {
    return id;
  } else if (id is String) {
    return int.tryParse(id) ?? id;
  } else {
    return null;
  }
}

// A custom function that converts the id value to a string
String _idToJson(dynamic id) {
  return id.toString();
}