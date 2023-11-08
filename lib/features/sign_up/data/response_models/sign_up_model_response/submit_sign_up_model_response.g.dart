// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_sign_up_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubmitSignUpModelResponseImpl _$$SubmitSignUpModelResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SubmitSignUpModelResponseImpl(
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      emailAddress: json['emailAddress'] as String?,
      idNumber: json['idNumber'] as String?,
      passportNumber: json['passportNumber'] as String?,
    );

Map<String, dynamic> _$$SubmitSignUpModelResponseImplToJson(
        _$SubmitSignUpModelResponseImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'phoneNumber': instance.phoneNumber,
      'emailAddress': instance.emailAddress,
      'idNumber': instance.idNumber,
      'passportNumber': instance.passportNumber,
    };
