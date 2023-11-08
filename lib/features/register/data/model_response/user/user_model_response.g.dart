// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelResponseImpl _$$UserModelResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UserModelResponseImpl(
      email: json['email'] as String,
      id: json['id'] as String?,
      idNumber: json['idNumber'] as String,
      surname: json['surname'] as String,
      firstName: json['firstName'] as String,
      mobile: json['mobile'] as String,
      passportNumber: json['passportNumber'] as String,
      profileType: json['profileType'] as String?,
      subscriptionType: json['subscriptionType'] as String?,
      workPermitNumber: json['workPermitNumber'] as String,
      isActive: json['isActive'] as bool?,
    );

Map<String, dynamic> _$$UserModelResponseImplToJson(
        _$UserModelResponseImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'id': instance.id,
      'idNumber': instance.idNumber,
      'surname': instance.surname,
      'firstName': instance.firstName,
      'mobile': instance.mobile,
      'passportNumber': instance.passportNumber,
      'profileType': instance.profileType,
      'subscriptionType': instance.subscriptionType,
      'workPermitNumber': instance.workPermitNumber,
      'isActive': instance.isActive,
    };
