import 'package:pickme/shared/remote/PickMeApiCore.dart';

import '../../domain/entities/jobs_landing_page_entity.dart';

abstract class GetJobsLandingPageDataService extends PickMeCoreApi{
  Future<JobsLandingPageEntity> getLandingPageData();
}