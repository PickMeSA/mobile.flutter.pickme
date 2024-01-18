import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'otp_business_model_response.dart';
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
    required String? firstName,
    required String? surname,
    required String? email,
    required String? mobile,
    required String? idNumber,
    required String? passportNumber,
    required String? type,
    required int? hourlyRate,
    required String? description,
    required Map<String, dynamic>? industry,
    required List<int>? skillIds,
    required List<Map<String,dynamic>>? skills,
    required int? industryID,
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
