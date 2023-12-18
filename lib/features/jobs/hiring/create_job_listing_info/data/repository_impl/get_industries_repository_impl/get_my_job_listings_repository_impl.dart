import 'package:injectable/injectable.dart';

import '../../../domain/entities/create_job_listing_info_page_entity.dart';
import '../../../domain/repository/get_job_listings_info_repository.dart';
import '../../service/get_job_listings_info/job_listing_info_service.dart';

@Injectable(as: GetJobListingsInfoRepository)
class GetJobListingsInfoRepositoryImpl extends GetJobListingsInfoRepository {
  final JobListingsInfoService industryService;

  GetJobListingsInfoRepositoryImpl({required this.industryService});

  @override
  Future<CreateJobListingInfoPageEntity> call({GetJobListingsInfoRepositoryParams? params}) async{
    try{
      return await industryService.getInfo();
    }catch(ex){
      rethrow;
    }
  }

}
