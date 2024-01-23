import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_data_model_response.freezed.dart';
part 'profile_data_model_response.g.dart';

@freezed
class ProfileDataModelResponse with _$ProfileDataModelResponse {
  const factory ProfileDataModelResponse({

    required String email,
    required String? id,
    required String idNumber,
    required String surname,
    required String firstName,
    required String mobile,
    required String passportNumber,
    required String? profileType,
    required String? subscriptionType,
    required String workPermitNumber,
    required bool? isActive,
  }) = _ProfileDataModelResponse;

  factory ProfileDataModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$ProfileDataModelResponseFromJson(json);
}
