// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HttpErrorModelImpl _$$HttpErrorModelImplFromJson(Map<String, dynamic> json) =>
    _$HttpErrorModelImpl(
      message: json['message'] as String,
      code: json['code'] as int,
    );

Map<String, dynamic> _$$HttpErrorModelImplToJson(
        _$HttpErrorModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
    };
