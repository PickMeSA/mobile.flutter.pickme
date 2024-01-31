import 'package:equatable/equatable.dart';

import 'work_times_entity.dart';


class JobApplicantEntity extends Equatable {
  final int? id;
  final String? userId;
  final String? fullName;
  final String? type;
  final int? industryId;
  final int? profilePictureId;
  final int? policeClearanceId;
  final double? averageRating;
  final int? hourlyRate;
  final WorkTimesEntity? workTimes;
  final String? description;
  final bool? acceptedTermsAndConditions;
  final bool? subscriptionPaid;
  final bool? isActive;
  final double? latitude;
  final double? longitude;
  final String? address;
  final String? createdAt;
  final String? updatedAt;
  final String? profilePicture;

  const JobApplicantEntity({
    this.id,
    this.userId,
    this.fullName,
    this.type,
    this.industryId,
    this.profilePictureId,
    this.policeClearanceId,
    this.averageRating,
    this.hourlyRate,
    this.workTimes,
    this.description,
    this.acceptedTermsAndConditions,
    this.subscriptionPaid,
    this.isActive,
    this.latitude,
    this.longitude,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.profilePicture,
  });

  @override
  List<Object?> get props => [
    id,
    userId,
    type,
    industryId,
    profilePictureId,
    policeClearanceId,
    averageRating,
    hourlyRate,
    workTimes,
    description,
    acceptedTermsAndConditions,
    subscriptionPaid,
    isActive,
    latitude,
    longitude,
    address,
    createdAt,
    updatedAt,
  ];

  @override
  bool get stringify => true;

  JobApplicantEntity copyWith({
    int? id,
    String? userId,
    String? type,
    int? industryId,
    int? profilePictureId,
    int? policeClearanceId,
    double? averageRating,
    int? hourlyRate,
    WorkTimesEntity? workTimes,
    String? description,
    bool? acceptedTermsAndConditions,
    bool? subscriptionPaid,
    bool? isActive,
    double? latitude,
    double? longitude,
    String? address,
    String? createdAt,
    String? updatedAt,
  }) {
    return JobApplicantEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      industryId: industryId ?? this.industryId,
      profilePictureId: profilePictureId ?? this.profilePictureId,
      policeClearanceId: policeClearanceId ?? this.policeClearanceId,
      averageRating: averageRating ?? this.averageRating,
      hourlyRate: hourlyRate ?? this.hourlyRate,
      workTimes: workTimes ?? this.workTimes,
      description: description ?? this.description,
      acceptedTermsAndConditions:
      acceptedTermsAndConditions ?? this.acceptedTermsAndConditions,
      subscriptionPaid: subscriptionPaid ?? this.subscriptionPaid,
      isActive: isActive ?? this.isActive,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return 'JobApplicantEntity(${props.map((prop) => '$prop: ${prop.toString()}, ').toList()})';
  }
}
