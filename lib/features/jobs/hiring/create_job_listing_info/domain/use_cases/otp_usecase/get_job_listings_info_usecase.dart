
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/jobs/hiring/create_job_listing_info/domain/entities/create_job_listing_info_page_entity.dart';
import 'package:pickme/shared/domain/entities/paginated_industry_object.dart';

import '../../repository/get_job_listings_info_repository.dart';


@Injectable()
class GetJobListingsInfoUseCase extends BaseUseCase<GetJobListingsInfoUseCaseParams, CreateJobListingInfoPageEntity>{

  final GetJobListingsInfoRepository getIndustriesRepository;

  GetJobListingsInfoUseCase({required this.getIndustriesRepository});

  @override
  Future<CreateJobListingInfoPageEntity> call({GetJobListingsInfoUseCaseParams? params}) async {
   try{
     return await getIndustriesRepository.call();
   }catch(ex){
     rethrow;
   }
  }
}

class GetJobListingsInfoUseCaseParams extends BaseUseCaseParams{
  GetJobListingsInfoUseCaseParams();
}
