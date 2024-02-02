import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/features/add_skills/domain/entities/skill_entity.dart';

import 'job_entity.dart';

class CreateJobPageJobEntity {
  final String title;
  final String description;
  final String address;
  final String status;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? startTime;
  final bool imFlexible;
  final String estimatedHours;
  final String? lat;
  final String? lng;
  final List<String> images;
  final List<SkillEntity> skills;

  CreateJobPageJobEntity({required this.title, required this.description, required this.address, required this.status, this.startDate, this.endDate, this.startTime, required this.imFlexible, required this.estimatedHours, required this.lat, required this.lng, required this.images, required this.skills});

  JobEntity toJobEntity() {
    return JobEntity(
      title: title,
      description: description,
      status: status,
      address: address,
      hourlyRate: null, 
      employerName: null, 
      startDate: startDate,
      endDate: endDate,
      startTime: startTime,
      estimatedHours: double.parse(estimatedHours),
      lat: double.parse(lat ?? "0.0"),
      lng: double.parse(lng ?? "0.0"),
      images: images.join(","),
      skills: skills,
      comments: "", 
      id: "", 
      industry: null, 
      distance: null, 
      customer: null, 
      jobInterestStatus: null, 
      jobInterestId: null, 
      profiles: null, 
      matches: null, 
      possibleApplicantMatchesCount: null, 
      jobApplicationsCount: null, 
      potentialMatchesRemoved: null, 
    );
  }
}