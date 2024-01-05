import 'package:pickme/shared/remote/PickMeApiCore.dart';

import '../../../domain/entities/create_job_listing_info_page_entity.dart';


abstract class JobListingsInfoService extends PickMeCoreApi{
  JobListingsInfoService();

  Future<CreateJobListingInfoPageEntity> getInfo();
}