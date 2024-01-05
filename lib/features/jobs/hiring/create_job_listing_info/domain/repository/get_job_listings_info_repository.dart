import 'package:pickme/base_classes/base_repository.dart';

import '../entities/create_job_listing_info_page_entity.dart';

abstract class GetJobListingsInfoRepository  extends BaseRepository<GetJobListingsInfoRepositoryParams, CreateJobListingInfoPageEntity>{}

class GetJobListingsInfoRepositoryParams extends BaseRepositoryParams{

  GetJobListingsInfoRepositoryParams();
}
