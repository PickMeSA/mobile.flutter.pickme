import 'package:pickme/base_classes/base_repository.dart';

import '../entities/jobs_landing_page_entity.dart';


abstract class GetJobLandingPageDataRepository  extends BaseRepository<GetJobLandingPageDataRepositoryParams, JobsLandingPageEntity>{}

class GetJobLandingPageDataRepositoryParams extends BaseRepositoryParams{

  GetJobLandingPageDataRepositoryParams();
}
