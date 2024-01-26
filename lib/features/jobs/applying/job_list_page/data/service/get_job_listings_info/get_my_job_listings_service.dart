import 'package:pickme/features/jobs/applying/job_list_page/domain/repository/get_my_job_listings_repository.dart';
import 'package:pickme/shared/remote/PickMeApiCore.dart';

import '../../../domain/entities/my_job_listings_page_entity.dart';



abstract class GetMyJobListingsService extends PickMeCoreApi{
  GetMyJobListingsService();

  Future<MyJobListingsPageEntity> getMyJobListings({required GetMyJobListingsRepositoryParams
  getMyJobListingsRepositoryParams});
}