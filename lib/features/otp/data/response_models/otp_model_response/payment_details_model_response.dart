import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_payment_details_model_response.dart';

part 'payment_details_model_response.freezed.dart';
part 'payment_details_model_response.g.dart';

@freezed
class PaymentDetailsModelResponse with _$PaymentDetailsModelResponse {
  const factory PaymentDetailsModelResponse({
    required OTPPaymentDetailsModelResponse paymentDetails,
  }) = _PaymentDetailsModelResponse;

  factory PaymentDetailsModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$PaymentDetailsModelResponseFromJson(json);
}
