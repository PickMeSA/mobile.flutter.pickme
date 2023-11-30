// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'membership_item_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MembershipItemModelResponseImpl _$$MembershipItemModelResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MembershipItemModelResponseImpl(
      name: json['name'] as String,
      description: json['description'] as String,
      information: (json['information'] as List<dynamic>)
          .map((e) =>
              InformationItemModelResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MembershipItemModelResponseImplToJson(
        _$MembershipItemModelResponseImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'information': instance.information,
    };
