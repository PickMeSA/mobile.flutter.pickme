import 'package:pickme/shared/domain/entities/candidate_profile_entity.dart';
import 'package:pickme/shared/domain/entities/pagination_entity.dart';

class PaginatedCandidateProfileEntity{
  final List<CandidateProfileEntity> candidates;
  final PaginationEntity pagination;

  PaginatedCandidateProfileEntity({required this.candidates, required this.pagination});
}