import 'package:equatable/equatable.dart';
import 'package:pickme/shared/domain/entities/pagination_entity.dart';

class CandidateProfileEntity extends Equatable{
  final String id;
  final String fullName;
  final String jobTitle;
  final int rating;
  final String? profilePicture;
  final double hourlyRate;
  const CandidateProfileEntity({
    required this.id,
    required this.fullName,
    required this.jobTitle,
    required this.rating,
    this.profilePicture,
    required this.hourlyRate,
  });
  @override
  List<Object?> get props => [id];
}

