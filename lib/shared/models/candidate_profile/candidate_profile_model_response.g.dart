// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate_profile_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CandidateProfileModelResponseImpl
    _$$CandidateProfileModelResponseImplFromJson(Map<String, dynamic> json) =>
        _$CandidateProfileModelResponseImpl(
          id: json['id'] as String,
          name: json['name'] as String,
          job_title: json['job_title'] as String,
          hourly_rate: (json['hourly_rate'] as num).toDouble(),
          rating: json['rating'] as int,
          profile_picture: json['profile_picture'] as String?,
        );

Map<String, dynamic> _$$CandidateProfileModelResponseImplToJson(
        _$CandidateProfileModelResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'job_title': instance.job_title,
      'hourly_rate': instance.hourly_rate,
      'rating': instance.rating,
      'profile_picture': instance.profile_picture,
    };
