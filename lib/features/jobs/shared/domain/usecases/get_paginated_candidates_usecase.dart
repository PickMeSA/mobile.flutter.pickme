
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/domain/entities/paginated_candidate_profile_entity.dart';

import '../repositories/get_paginated_candidates_repository.dart';


@Injectable()
class GetPaginatedCandidatesByIndustryUseCase extends BaseUseCase<GetPaginatedCandidatesByIndustryUseCaseParams, PaginatedCandidateProfileEntity>{

  final GetPaginatedCandidatesByIndustryRepository getPaginatedCandidateProfilesRepository;

  GetPaginatedCandidatesByIndustryUseCase({required this.getPaginatedCandidateProfilesRepository});

  @override
  Future<PaginatedCandidateProfileEntity> call({GetPaginatedCandidatesByIndustryUseCaseParams? params}) async {
   try{
     return await getPaginatedCandidateProfilesRepository.call(
         params: GetPaginatedCandidatesByIndustryRepositoryParams());
   }catch(ex){
     rethrow;
   }
  }
}

class GetPaginatedCandidatesByIndustryUseCaseParams extends BaseUseCaseParams{
  GetPaginatedCandidatesByIndustryUseCaseParams();
}
