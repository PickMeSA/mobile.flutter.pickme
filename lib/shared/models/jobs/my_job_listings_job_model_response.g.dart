// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_job_listings_job_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyJobListingsJobModelResponseImpl
    _$$MyJobListingsJobModelResponseImplFromJson(Map<String, dynamic> json) =>
        _$MyJobListingsJobModelResponseImpl(
          title: json['title'] as String?,
          description: json['description'] as String?,
          status: json['status'] as String?,
          startDate: json['startDate'] as String?,
          endDate: json['endDate'] as String?,
          startTime: json['startTime'] as String?,
          estimatedHours: (json['estimatedHours'] as num?)?.toDouble(),
          lat: (json['lat'] as num?)?.toDouble(),
          lng: (json['lng'] as num?)?.toDouble(),
          images: json['images'] as String?,
          skills: json['skills'] as String?,
          id: json['id'] as String?,
          distance: (json['distance'] as num?)?.toDouble(),
          address: json['address'] as String?,
        );

Map<String, dynamic> _$$MyJobListingsJobModelResponseImplToJson(
        _$MyJobListingsJobModelResponseImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'status': instance.status,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'startTime': instance.startTime,
      'estimatedHours': instance.estimatedHours,
      'lat': instance.lat,
      'lng': instance.lng,
      'images': instance.images,
      'skills': instance.skills,
      'id': instance.id,
      'distance': instance.distance,
      'address': instance.address,
    };
