import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_qualification_model_response_model_response.freezed.dart';
part 'otp_qualification_model_response_model_response.g.dart';

@freezed
class OTPQualificationModelResponse with _$OTPQualificationModelResponse {
  const factory OTPQualificationModelResponse({
    required String? supportedDocumentId,
    required String? type,
    required String? name,
    required String? issuingOrganization,
    required String? issueDate
  }) = _OTPQualificationModelResponse;

  factory OTPQualificationModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$OTPQualificationModelResponseFromJson(json);
}
