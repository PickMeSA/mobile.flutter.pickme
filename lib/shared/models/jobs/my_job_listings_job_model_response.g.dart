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
          address: json['address'] as String?,
          startDate: json['startDate'] as String?,
          endDate: json['endDate'] as String?,
          startTime: json['startTime'] as String?,
          estimatedHours: (json['estimatedHours'] as num?)?.toDouble(),
          lat: (json['lat'] as num?)?.toDouble(),
          lng: (json['lng'] as num?)?.toDouble(),
          images: json['images'] as String?,
          skills: (json['skills'] as List<dynamic>?)
              ?.map((e) =>
                  SkillsModelResponse.fromJson(e as Map<String, dynamic>))
              .toList(),
          industries: (json['industries'] as List<dynamic>?)
              ?.map((e) => OTPIndustryModelModelResponse.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          customer: json['customer'] == null
              ? null
              : JobCustomerModelResponse.fromJson(
                  json['customer'] as Map<String, dynamic>),
          id: json['id'] as String?,
          employerName: json['employerName'] as String?,
          jobInterestStatus: json['jobInterestStatus'] as String?,
          jobInterestId: json['jobInterestId'] as String?,
          distance: (json['distance'] as num?)?.toDouble(),
          jobApplicationsCount: json['jobApplicationsCount'] as int?,
          possibleApplicantMatchesCount:
              json['possibleApplicantMatchesCount'] as int?,
          applications: (json['applications'] as List<dynamic>?)
              ?.map((e) => JobInterestModel.fromJson(e as Map<String, dynamic>))
              .toList(),
          potentialMatches: (json['potentialMatches'] as List<dynamic>?)
              ?.map((e) => JobInterestModel.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$MyJobListingsJobModelResponseImplToJson(
        _$MyJobListingsJobModelResponseImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'status': instance.status,
      'address': instance.address,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'startTime': instance.startTime,
      'estimatedHours': instance.estimatedHours,
      'lat': instance.lat,
      'lng': instance.lng,
      'images': instance.images,
      'skills': instance.skills,
      'industries': instance.industries,
      'customer': instance.customer,
      'id': instance.id,
      'employerName': instance.employerName,
      'jobInterestStatus': instance.jobInterestStatus,
      'jobInterestId': instance.jobInterestId,
      'distance': instance.distance,
      'jobApplicationsCount': instance.jobApplicationsCount,
      'possibleApplicantMatchesCount': instance.possibleApplicantMatchesCount,
      'applications': instance.applications,
      'potentialMatches': instance.potentialMatches,
    };

_$JobInterestModelImpl _$$JobInterestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$JobInterestModelImpl(
      applicant: Applicant.fromJson(json['applicant'] as Map<String, dynamic>),
      jobInterestId: json['jobInterestId'] as String?,
    );

Map<String, dynamic> _$$JobInterestModelImplToJson(
        _$JobInterestModelImpl instance) =>
    <String, dynamic>{
      'applicant': instance.applicant,
      'jobInterestId': instance.jobInterestId,
    };

_$ApplicantImpl _$$ApplicantImplFromJson(Map<String, dynamic> json) =>
    _$ApplicantImpl(
      userId: json['userId'] as String,
      firstName: json['firstName'] as String,
      surname: json['surname'] as String,
      profileImage: json['profileImage'] as String,
      averageRating: json['averageRating'] as int,
      address: json['address'] as String,
      hourlyRate: (json['hourlyRate'] as num).toDouble(),
      jobTitle: json['jobTitle'] as String,
    );

Map<String, dynamic> _$$ApplicantImplToJson(_$ApplicantImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'firstName': instance.firstName,
      'surname': instance.surname,
      'profileImage': instance.profileImage,
      'averageRating': instance.averageRating,
      'address': instance.address,
      'hourlyRate': instance.hourlyRate,
      'jobTitle': instance.jobTitle,
    };
