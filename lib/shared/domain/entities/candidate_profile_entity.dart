import 'package:equatable/equatable.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/shared/domain/entities/pagination_entity.dart';

class CandidateProfileEntity extends Equatable{
  final String id;
  final String fullName;
  final String? about;
  final String? jobTitle;
  final String? skills;
  final int? rating;
  final String? profilePicture;
  final String? photos;
  final String? jobInterestId;
  final double? hourlyRate;
  final List<WorkExperienceEntity>? workExperience;
  const CandidateProfileEntity({
    required this.id,
    required this.fullName,
    this.about,
    this.jobTitle,
    this.skills,
    this.rating,
    this.profilePicture,
    this.hourlyRate,
    this.workExperience,
    this.photos,
    this.jobInterestId,
  });
  @override
  List<Object?> get props => [id];
}

class WorkExperienceEntity extends QualificationContract{

  WorkExperienceEntity({required super.name, super.qualificationType = AppQualificationType.experience, required super.institutionName, required super.period});
}