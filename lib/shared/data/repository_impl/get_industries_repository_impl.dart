import 'package:injectable/injectable.dart';
import 'package:pickme/shared/domain/entities/industry_entity.dart';
import 'package:pickme/shared/domain/repository/get_industries_repository.dart';
import 'package:pickme/shared/domain/entities/paginated_industry_object.dart';
import 'package:pickme/shared/services/remote/api_service/industries_service/industry_service.dart';

@Injectable(as: GetIndustriesRepository)
class GetIndustriesRepositoryImpl extends GetIndustriesRepository {
  final IndustryService industryService;

  GetIndustriesRepositoryImpl({required this.industryService});

  @override
  Future<PaginatedIndustryEntity> call({GetIndustriesRepositoryParams? params}) async{
    try{
      return await industryService.getIndustries(params: GetIndustriesServiceParams(searchText: params?.searchText??""));
    }catch(ex){
      rethrow;
    }
  }

}
