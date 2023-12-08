import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/shared/domain/entities/paginated_industry_object.dart';

abstract class GetMyJobListingsRepository  extends BaseRepository<GetMyJobListingsRepositoryParams, PaginatedIndustryEntity>{}

class GetMyJobListingsRepositoryParams extends BaseRepositoryParams{

  GetMyJobListingsRepositoryParams();
}
