// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_app_purchase_activate_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InAppPurchaseActivationRequestModelImpl
    _$$InAppPurchaseActivationRequestModelImplFromJson(
            Map<String, dynamic> json) =>
        _$InAppPurchaseActivationRequestModelImpl(
          userIdentifier: json['user_identifier'] as String,
          productIdentifier: json['product_identifier'] as String,
          skin: json['skin'] as String,
          receiptNumber: json['receipt_number'] as String,
          icloudIdentifier: json['icloud_identifier'] as String,
        );

Map<String, dynamic> _$$InAppPurchaseActivationRequestModelImplToJson(
        _$InAppPurchaseActivationRequestModelImpl instance) =>
    <String, dynamic>{
      'user_identifier': instance.userIdentifier,
      'product_identifier': instance.productIdentifier,
      'skin': instance.skin,
      'receipt_number': instance.receiptNumber,
      'icloud_identifier': instance.icloudIdentifier,
    };
