import 'package:equatable/equatable.dart';
import 'package:pickme/features/add_skills/domain/entities/skill_entity.dart';
import 'package:pickme/shared/models/skills_list_model_response/skills_model_response.dart';
import 'package:pickme/shared/models/jobs/my_job_listings_job_model_response.dart';

class JobInterestEntity extends Equatable{
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

  const JobInterestEntity({
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
    this.comments = "",
    required this.id,
    this.distance
  });
  factory JobInterestEntity.fromResponse(MyJobListingsJobModelResponse response){
    return JobInterestEntity(
        title: response.title??"",
        startDate: (response.startDate!=null && response.startDate!= "")?DateTime.parse(response.startDate!):DateTime.now(),
        endDate: (response.endDate!=null && response.endDate != "")?DateTime.parse(response.endDate!):DateTime.now(),
        startTime: response.startTime,
        description: response.description??"",
        images: response.images??"",
        status: response.status??"",
        estimatedHours: response.estimatedHours??0,
        lat: response.lat,
        lng: response.lng,
        skills: response.skills?.map((e) => SkillEntity(skill: e.skill, id: e.id)).toList()??[],
        id: response.id.toString(),
        employerName: response.employerName,
        distance: response.distance??0
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
  @override
  List<Object?> get props => [id];
}