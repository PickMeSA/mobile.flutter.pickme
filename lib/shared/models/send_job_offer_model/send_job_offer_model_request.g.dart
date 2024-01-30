// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_job_offer_model_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SendJobOfferModelRequestImpl _$$SendJobOfferModelRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$SendJobOfferModelRequestImpl(
      jobId: json['jobId'] as String,
      customerUid: json['customerUid'] as String,
      labourerUid: json['labourerUid'] as String,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      startTime: json['startTime'] as String?,
      estimatedHours: (json['estimatedHours'] as num?)?.toDouble(),
      comments: json['comments'] as String?,
      type: json['type'] as String,
      status: json['status'] as String,
      bookingId: json['bookingId'] as String?,
    );

Map<String, dynamic> _$$SendJobOfferModelRequestImplToJson(
        _$SendJobOfferModelRequestImpl instance) =>
    <String, dynamic>{
      'jobId': instance.jobId,
      'customerUid': instance.customerUid,
      'labourerUid': instance.labourerUid,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'startTime': instance.startTime,
      'estimatedHours': instance.estimatedHours,
      'comments': instance.comments,
      'type': instance.type,
      'status': instance.status,
      'bookingId': instance.bookingId,
    };
