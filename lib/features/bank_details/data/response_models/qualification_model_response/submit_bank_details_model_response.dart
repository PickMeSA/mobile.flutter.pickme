import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_qualification_model_response_model_response.dart';
import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_work_experience_model_response.dart';

part 'submit_bank_details_model_response.freezed.dart';
part 'submit_bank_details_model_response.g.dart';

@freezed
class SubmittedBankDetailsModelResponse with _$SubmittedBankDetailsModelResponse {
  const factory SubmittedBankDetailsModelResponse({
    required String bankName,
    required String bankAccountType,
    required String bankAccountNumber,
    required String bankBranchCode,
    String? taxNumber,
    String? vatNumber,
  }) = _SubmittedBankDetailsModelResponse;

  factory SubmittedBankDetailsModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$SubmittedBankDetailsModelResponseFromJson(json);
}
