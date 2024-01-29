// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_customer_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobCustomerModelResponseImpl _$$JobCustomerModelResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$JobCustomerModelResponseImpl(
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      surname: json['surname'] as String?,
      averageRating: json['averageRating'] as int?,
      profileImage: json['profileImage'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$JobCustomerModelResponseImplToJson(
        _$JobCustomerModelResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'surname': instance.surname,
      'averageRating': instance.averageRating,
      'profileImage': instance.profileImage,
      'address': instance.address,
    };
