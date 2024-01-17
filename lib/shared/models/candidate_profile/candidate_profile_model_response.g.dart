// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate_profile_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CandidateProfileModelResponseImpl
    _$$CandidateProfileModelResponseImplFromJson(Map<String, dynamic> json) =>
        _$CandidateProfileModelResponseImpl(
          id: json['id'] as String,
          userId: json['userId'] as String,
          firstName: json['firstName'] as String,
          surname: json['surname'] as String,
          jobTitle: json['jobTitle'] as String?,
          skills: json['skills'] as String?,
          description: json['description'] as String?,
          photos: json['photos'] as String?,
          workExperience: (json['workExperience'] as List<dynamic>?)
              ?.map((e) => WorkExperienceModelResponse.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          hourlyRate: (json['hourlyRate'] as num?)?.toDouble(),
          rating: json['rating'] as int?,
          profilePictureUrl: json['profilePictureUrl'] as String?,
        );

Map<String, dynamic> _$$CandidateProfileModelResponseImplToJson(
        _$CandidateProfileModelResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'firstName': instance.firstName,
      'surname': instance.surname,
      'jobTitle': instance.jobTitle,
      'skills': instance.skills,
      'description': instance.description,
      'photos': instance.photos,
      'workExperience': instance.workExperience,
      'hourlyRate': instance.hourlyRate,
      'rating': instance.rating,
      'profilePictureUrl': instance.profilePictureUrl,
    };
