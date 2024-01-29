import 'package:pickme/shared/domain/repository/get_industries_repository.dart';
import 'package:pickme/shared/domain/entities/paginated_industry_object.dart';
import 'package:pickme/shared/remote/PickMeApiCore.dart';

abstract class IndustryService extends  PickMeCoreApi{
  IndustryService();

  Future<PaginatedIndustryEntity> getIndustries({GetIndustriesServiceParams? params});
}


class GetIndustriesServiceParams{
  final String searchText;
  GetIndustriesServiceParams({required this.searchText});
}
