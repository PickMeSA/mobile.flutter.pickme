// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'membership_item_list_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MembershipItemListModelResponseImpl
    _$$MembershipItemListModelResponseImplFromJson(Map<String, dynamic> json) =>
        _$MembershipItemListModelResponseImpl(
          membershipItemListModelResponse:
              (json['membershipItemListModelResponse'] as List<dynamic>)
                  .map((e) => MembershipItemModelResponse.fromJson(
                      e as Map<String, dynamic>))
                  .toList(),
        );

Map<String, dynamic> _$$MembershipItemListModelResponseImplToJson(
        _$MembershipItemListModelResponseImpl instance) =>
    <String, dynamic>{
      'membershipItemListModelResponse':
          instance.membershipItemListModelResponse,
    };
