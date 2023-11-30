import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_terms_and_conditions_model_response.freezed.dart';
part 'get_terms_and_conditions_model_response.g.dart';

@freezed
class GetTermsAndConditionsModelResponse with _$GetTermsAndConditionsModelResponse {
  const factory GetTermsAndConditionsModelResponse({
    required String? termsAndConditions,
  }) = _GetTermsAndConditionsModelResponse;

  factory GetTermsAndConditionsModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$GetTermsAndConditionsModelResponseFromJson(json);
}
