import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_payment_details_model_response.freezed.dart';
part 'otp_payment_details_model_response.g.dart';

@freezed
class OTPPaymentDetailsModelResponse with _$OTPPaymentDetailsModelResponse {
  const factory OTPPaymentDetailsModelResponse({
    required String? bankAccountHolder,
    required String? bankName,
    required String? bankAccountType,
    required String? bankAccountNumber,
    required String? bankBranchCode,
    required String? taxNumber,
    required String? vatNumber
  }) = _OTPPaymentDetailsModelResponse;

  factory OTPPaymentDetailsModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$OTPPaymentDetailsModelResponseFromJson(json);
}
