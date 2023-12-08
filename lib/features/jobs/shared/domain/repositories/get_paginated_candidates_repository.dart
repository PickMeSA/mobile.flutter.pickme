import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/shared/domain/entities/paginated_candidate_profile_entity.dart';

abstract class GetPaginatedCandidatesByIndustryRepository  extends BaseRepository<GetPaginatedCandidatesByIndustryRepositoryParams, PaginatedCandidateProfileEntity>{}

class GetPaginatedCandidatesByIndustryRepositoryParams extends BaseRepositoryParams{

  GetPaginatedCandidatesByIndustryRepositoryParams();
}
