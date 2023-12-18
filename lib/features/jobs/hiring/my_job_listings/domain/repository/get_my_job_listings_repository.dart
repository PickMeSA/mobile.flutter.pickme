import 'package:pickme/base_classes/base_repository.dart';

import '../entities/my_job_listings_page_entity.dart';

abstract class GetMyJobListingsRepository  extends BaseRepository<GetMyJobListingsRepositoryParams, MyJobListingsPageEntity>{}

class GetMyJobListingsRepositoryParams extends BaseRepositoryParams{

  GetMyJobListingsRepositoryParams();
}
