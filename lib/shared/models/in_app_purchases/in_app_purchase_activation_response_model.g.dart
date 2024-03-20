// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_app_purchase_activation_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InAppPurchaseActivationResponseModelImpl
    _$$InAppPurchaseActivationResponseModelImplFromJson(
            Map<String, dynamic> json) =>
        _$InAppPurchaseActivationResponseModelImpl(
          activated: json['activated'] as bool,
          httpErrorModel: json['httpErrorModel'] == null
              ? null
              : HttpErrorModel.fromJson(
                  json['httpErrorModel'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$InAppPurchaseActivationResponseModelImplToJson(
        _$InAppPurchaseActivationResponseModelImpl instance) =>
    <String, dynamic>{
      'activated': instance.activated,
      'httpErrorModel': instance.httpErrorModel,
    };
