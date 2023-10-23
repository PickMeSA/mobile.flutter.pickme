import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel{
  const factory UserModel({
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

}) = _UserModel;

  factory UserModel.fromJson(Map<String,Object?> json) => _$UserModelFromJson(json);
}