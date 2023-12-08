import 'package:injectable/injectable.dart';
import 'package:pickme/shared/domain/entities/paginated_industry_object.dart';
import 'package:pickme/shared/services/remote/api_service/industries_service/industry_service.dart';

import '../../../domain/repository/get_my_job_listings_repository.dart';

@Injectable(as: GetMyJobListingsRepository)
class GetMyJobListingsRepositoryImpl extends GetMyJobListingsRepository {
  final IndustryService industryService;

  GetMyJobListingsRepositoryImpl({required this.industryService});

  @override
  Future<PaginatedIndustryEntity> call({GetMyJobListingsRepositoryParams? params}) async{
    try{
      return await industryService.getIndustries();
    }catch(ex){
      rethrow;
    }
  }

}
