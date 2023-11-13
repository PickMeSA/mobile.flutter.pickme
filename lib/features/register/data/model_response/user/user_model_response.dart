import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model_response.freezed.dart';
part 'user_model_response.g.dart';

@freezed
class UserModelResponse with _$UserModelResponse{
  const factory UserModelResponse({
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

}) = _UserModelResponse;

  factory UserModelResponse.fromJson(Map<String,Object?> json) => _$UserModelResponseFromJson(json);
}