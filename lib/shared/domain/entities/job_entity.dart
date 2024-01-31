import 'package:equatable/equatable.dart';
import 'package:pickme/features/add_skills/domain/entities/skill_entity.dart';
import 'package:pickme/shared/domain/entities/candidate_profile_entity.dart';
import 'package:pickme/shared/domain/entities/industry_entity.dart';
import 'package:pickme/shared/domain/entities/job_applicant_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/models/jobs/my_job_listings_job_model_response.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/models/skills_list_model_response/skills_model_response.dart';

import 'job_customer_entity.dart';
import 'work_times_entity.dart';

class JobEntity extends Equatable{
final String title;
final String description;
final String status;
final String? address;
final String? employerName;
final double? hourlyRate;
final DateTime? startDate;
final DateTime? endDate;
final String? startTime;
final double estimatedHours;
final double? lat;
final double? lng;
final String images;
final List<SkillEntity> skills;
final String comments;
final String id;
final double? distance;
final IndustryEntity? industry;
final JobCustomerEntity? customer;
final String? jobInterestStatus;
final String? jobInterestId;
final int? jobApplicationsCount;
final int? possibleApplicantMatchesCount;
final List<CandidateProfileEntity>? profiles;
final List<CandidateProfileEntity>? matches;
final String? potentialMatchesRemoved;

  const JobEntity({
    required this.title,
    required this.description,
    required this.status,
    this.employerName,
    this.address,
    this.hourlyRate,
    this.startDate,
    this.endDate,
    this.startTime,
    required this.estimatedHours,
    required this.lat,
    required this.lng,
    required this.images,
    required this.skills,
    this.industry,
    this.comments = "",
    required this.id,
    this.distance,
    this.customer,
    this.jobInterestStatus,
    this.jobInterestId,
    this.profiles,
    this.matches,
    this.possibleApplicantMatchesCount,
    this.jobApplicationsCount,
    this.potentialMatchesRemoved,
  });
  factory JobEntity.fromResponse(MyJobListingsJobModelResponse response){
    return JobEntity(
        title: response.title??"",
        startDate: (response.startDate!=null && response.startDate!= "")?DateTime.parse(response.startDate!):DateTime.now(),
        endDate: (response.endDate!=null && response.endDate != "")?DateTime.parse(response.endDate!):DateTime.now(),
        startTime: response.startTime,
        description: response.description??"",
        images: response.images??"",
        status: response.status??"",
        estimatedHours: response.estimatedHours??0,
        jobInterestStatus: response.jobInterestStatus,
      jobInterestId: response.jobInterestId,
      jobApplicationsCount: response.jobApplicationsCount,
      possibleApplicantMatchesCount: response.possibleApplicantMatchesCount,
      potentialMatchesRemoved: response.potentialMatchesRemoved,
        lat: response.lat,
        lng: response.lng,
        skills: response.skills?.map((e) => SkillEntity(skill: e.skill, id: e.id)).toList()??[],
        id: response.id.toString(),
        employerName: response.employerName,
        distance: response.distance??0,
      industry: (response.industries!=null && response.industries!.isNotEmpty)?IndustryEntity(id:response.industries![0].id, industry: response.industries![0].industry):null,
        customer: response.customer==null?null:JobCustomerEntity(
          id: response.customer!.id,
          firstName: response.customer!.firstName,
          surname: response.customer!.surname,
          averageRating: response.customer!.averageRating,
          profileImage: response.customer!.profileImage,
          address: response.customer!.address,),
      address: response.address??"",
      profiles: response.applications?.map((jobInterest)=>CandidateProfileEntity(
          id: jobInterest.applicant.userId,
          fullName: "${jobInterest.applicant.firstName} ${jobInterest.applicant.surname}",
          jobTitle: jobInterest.applicant.jobTitle,
          hourlyRate: jobInterest.applicant.hourlyRate,
          rating: jobInterest.applicant.averageRating,
          profilePicture: jobInterest.applicant.profileImage,
          jobInterestId: jobInterest.jobInterestId
      )).toList() ?? [],
      matches: response.potentialMatches?.map((jobInterest)=>CandidateProfileEntity(
          id: jobInterest.applicant.userId,
          fullName: "${jobInterest.applicant.firstName} ${jobInterest.applicant.surname}",
          jobTitle: jobInterest.applicant.jobTitle,
          hourlyRate: jobInterest.applicant.hourlyRate,
          rating: jobInterest.applicant.averageRating,
          profilePicture: jobInterest.applicant.profileImage,
          jobInterestId: jobInterest.jobInterestId
      )).toList() ?? [],

    );
  }

  MyJobListingsJobModelResponse toMyJobListingsJobModelResponse(){
    return MyJobListingsJobModelResponse(
        title: title,
        description: description,
        images: images,
        status: status,
        startDate: startDate!.toIso8601String(),
        endDate: endDate!.toIso8601String(),
        startTime: startTime!,
        estimatedHours: estimatedHours,
        lat: lat,
        lng: lng,
        skills: skills.map((e) => SkillsModelResponse(id: e.id, skill: e.skill)).toList(),
        id: id,
        distance: distance
    );
  }

JobEntity copyWith({
  String? title,
  String? description,
  String? status,
  String? address,
  String? employerName,
  double? hourlyRate,
  DateTime? startDate,
  DateTime? endDate,
  String? startTime,
  double? estimatedHours,
  double? lat,
  double? lng,
  String? images,
  List<SkillEntity>? skills,
  String? comments,
  String? id,
  double? distance,
  IndustryEntity? industry,
  JobCustomerEntity? customer,
  List<CandidateProfileEntity>? profiles,
}) {
  return JobEntity(
    title: title ?? this.title,
    description: description ?? this.description,
    status: status ?? this.status,
    address: address ?? this.address,
    employerName: employerName ?? this.employerName,
    hourlyRate: hourlyRate ?? this.hourlyRate,
    startDate: startDate ?? this.startDate,
    endDate: endDate ?? this.endDate,
    startTime: startTime ?? this.startTime,
    estimatedHours: estimatedHours ?? this.estimatedHours,
    lat: lat ?? this.lat,
    lng: lng ?? this.lng,
    images: images ?? this.images,
    skills: skills ?? this.skills,
    comments: comments ?? this.comments,
    id: id ?? this.id,
    distance: distance ?? this.distance,
    industry: industry ?? this.industry,
    customer: customer ?? this.customer,
    profiles: profiles ?? this.profiles,
  );
}
@override
String toString() {
  return 'JobEntity('
      'title: $title, '
      'description: $description, '
      'status: $status, '
      'address: $address, '
      'employerName: $employerName, '
      'hourlyRate: $hourlyRate, '
      'startDate: $startDate, '
      'endDate: $endDate, '
      'startTime: $startTime, '
      'estimatedHours: $estimatedHours, '
      'lat: $lat, '
      'lng: $lng, '
      'images: $images, '
      'skills: $skills, '
      'comments: $comments, '
      'id: $id, '
      'distance: $distance, '
      'industry: $industry, '
      'profiles: $profiles, '
      'customer: $customer)';
}
  @override
  List<Object?> get props => [id];
}