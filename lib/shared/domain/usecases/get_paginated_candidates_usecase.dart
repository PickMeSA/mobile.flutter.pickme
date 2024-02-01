
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/domain/entities/paginated_candidate_profile_entity.dart';

import '../repository/get_paginated_candidates_repository.dart';


@Injectable()
class GetPaginatedCandidatesByIndustryUseCase extends BaseUseCase<GetPaginatedCandidatesByIndustryUseCaseParams, PaginatedCandidateProfileEntity>{

  final GetPaginatedCandidatesByIndustryRepository getPaginatedCandidateProfilesRepository;

  GetPaginatedCandidatesByIndustryUseCase({required this.getPaginatedCandidateProfilesRepository});

  @override
  Future<PaginatedCandidateProfileEntity> call({GetPaginatedCandidatesByIndustryUseCaseParams? params}) async {
   try{
     return await getPaginatedCandidateProfilesRepository.call(
         params: GetPaginatedCandidatesByIndustryRepositoryParams(
           lat: params?.lat,
           lng: params?.lng,
           pageNumber: params?.pageNumber,
           pageSize: params?.pageSize,
           maxDistance: params?.maxDistance,
           minHourlyRate: params?.minHourlyRate,
           maxHourlyRate: params?.maxHourlyRate,
           minRating: params?.minRating,
           industryId: params?.industryId,
         ));
   }catch(ex){
     rethrow;
   }
  }
}

class GetPaginatedCandidatesByIndustryUseCaseParams extends BaseUseCaseParams{
  final int? pageNumber;
  final int? pageSize;
  final double? maxDistance;
  final double? minHourlyRate;
  final double? maxHourlyRate;
  final int? minRating;
  final String? industryId;
  final double? lat;
  final double? lng;
  GetPaginatedCandidatesByIndustryUseCaseParams({
     this.lat,
     this.lng,
    this.pageNumber,
    this.pageSize,
    this.maxDistance,
    this.minHourlyRate,
    this.maxHourlyRate,
    this.minRating,
    this.industryId,
  });
}
