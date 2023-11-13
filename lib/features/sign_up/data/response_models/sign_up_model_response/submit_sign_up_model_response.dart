import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_sign_up_model_response.freezed.dart';
part 'submit_sign_up_model_response.g.dart';

@freezed
class SubmitSignUpModelResponse with _$SubmitSignUpModelResponse {
  const factory SubmitSignUpModelResponse({
    required String? name,
    required String? surname,
    required String? phoneNumber,
    required String? emailAddress,
    required String? idNumber,
    required String? passportNumber,
  }) = _SubmitSignUpModelResponse;

  factory SubmitSignUpModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$SubmitSignUpModelResponseFromJson(json);
}
