// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_app_purchase_activate_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InAppPurchaseActivationRequestModelImpl
    _$$InAppPurchaseActivationRequestModelImplFromJson(
            Map<String, dynamic> json) =>
        _$InAppPurchaseActivationRequestModelImpl(
          userIdentifier: json['userIdentifier'] as String,
          productIdentifier: json['productIdentifier'] as String,
          skin: json['skin'] as String,
          transactionID: json['transactionID'] as String,
          verificationData: json['verificationData'] as String,
        );

Map<String, dynamic> _$$InAppPurchaseActivationRequestModelImplToJson(
        _$InAppPurchaseActivationRequestModelImpl instance) =>
    <String, dynamic>{
      'userIdentifier': instance.userIdentifier,
      'productIdentifier': instance.productIdentifier,
      'skin': instance.skin,
      'transactionID': instance.transactionID,
      'verificationData': instance.verificationData,
    };
