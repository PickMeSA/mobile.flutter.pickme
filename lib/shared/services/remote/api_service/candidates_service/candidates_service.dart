import 'package:pickme/features/jobs/shared/domain/repositories/get_paginated_candidates_repository.dart';
import 'package:pickme/shared/domain/entities/paginated_candidate_profile_entity.dart';
import 'package:pickme/shared/remote/PickMeApiCore.dart';

abstract class CandidatesService extends  PickMeCoreApi{
  CandidatesService();

  Future<PaginatedCandidateProfileEntity> getPaginatedCandidateProfiles(GetPaginatedCandidatesByIndustryRepositoryParams? params);
}
