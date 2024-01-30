import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/shared/domain/entities/paginated_industry_object.dart';

abstract class GetIndustriesRepository  extends BaseRepository<GetIndustriesRepositoryParams, PaginatedIndustryEntity>{}

class GetIndustriesRepositoryParams extends BaseRepositoryParams{
  final String searchText;
  GetIndustriesRepositoryParams({required this.searchText});
}
