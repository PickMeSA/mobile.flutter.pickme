import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'setup-profile_remote-submit_profile_type_model_response.freezed.dart';
part 'setup-profile_remote-submit_profile_type_model_response.g.dart';

@freezed
class SetupProfileSubmitprofileTypeModelResponse with _$SetupProfileSubmitprofileTypeModelResponse {
  const factory SetupProfileSubmitprofileTypeModelResponse({
    required String? type,
  }) = _SetupProfileSubmitprofileTypeModelResponse;

  factory SetupProfileSubmitprofileTypeModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$SetupProfileSubmitprofileTypeModelResponseFromJson(json);
}
