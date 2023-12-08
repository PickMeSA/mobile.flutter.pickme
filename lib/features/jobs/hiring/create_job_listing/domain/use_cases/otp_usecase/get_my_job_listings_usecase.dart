
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/domain/entities/paginated_industry_object.dart';

import '../../repository/get_my_job_listings_repository.dart';


@Injectable()
class GetMyJobListingsUseCase extends BaseUseCase<GetMyJobListingsUseCaseParams, PaginatedIndustryEntity>{

  final GetMyJobListingsRepository getIndustriesRepository;

  GetMyJobListingsUseCase({required this.getIndustriesRepository});

  @override
  Future<PaginatedIndustryEntity> call({GetMyJobListingsUseCaseParams? params}) async {
   try{
     return await getIndustriesRepository.call(
         params: GetMyJobListingsRepositoryParams());
   }catch(ex){
     rethrow;
   }
  }
}

class GetMyJobListingsUseCaseParams extends BaseUseCaseParams{
  GetMyJobListingsUseCaseParams();
}
