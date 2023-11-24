import 'package:injectable/injectable.dart';
import 'package:pickme/features/jobs/hiring/landing_page/domain/repository/get_industries_repository.dart';
import 'package:pickme/features/jobs/hiring/service_category_candidates/domain/repository/get_paginated_candidates_repository.dart';
import 'package:pickme/shared/domain/entities/paginated_candidate_profile_entity.dart';
import 'package:pickme/shared/services/remote/api_service/candidates_service/candidates_service.dart';
import 'package:pickme/shared/services/remote/api_service/industries_service/industry_service.dart';

@Injectable(as: GetPaginatedCandidatesByIndustryRepository)
class GetPaginatedCandidatesByIndustryRepositoryImpl extends GetPaginatedCandidatesByIndustryRepository {
  final CandidatesService candidatesService;

  GetPaginatedCandidatesByIndustryRepositoryImpl({required this.candidatesService});

  @override
  Future<PaginatedCandidateProfileEntity> call({GetPaginatedCandidatesByIndustryRepositoryParams? params}) async{
    try{
      return await candidatesService.getPaginatedCandidateProfiles();
    }catch(ex){
      rethrow;
    }
  }

}
