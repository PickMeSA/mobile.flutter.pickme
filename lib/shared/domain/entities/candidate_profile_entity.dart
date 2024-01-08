import 'package:equatable/equatable.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/shared/domain/entities/pagination_entity.dart';

class CandidateProfileEntity extends Equatable{
  final String id;
  final String fullName;
  final String about;
  final String jobTitle;
  final String skills;
  final int rating;
  final String? profilePicture;
  final String photos;
  final double hourlyRate;
  final List<WorkExperienceEntity> workExperience;
  const CandidateProfileEntity({
    required this.id,
    required this.fullName,
    required this.about,
    required this.jobTitle,
    required this.skills,
    required this.rating,
    this.profilePicture,
    required this.hourlyRate,
    required this.photos,
    required this.workExperience,
  });
  @override
  List<Object?> get props => [id];
}

class WorkExperienceEntity extends QualificationContract{

  WorkExperienceEntity({required super.name, super.qualificationType = AppQualificationType.experience, required super.institutionName, required super.period});
}