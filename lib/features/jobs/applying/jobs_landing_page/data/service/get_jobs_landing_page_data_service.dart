import 'package:pickme/features/jobs/applying/jobs_landing_page/domain/entities/jobs_landing_page_entity.dart';
import 'package:pickme/shared/remote/PickMeApiCore.dart';

abstract class GetJobsLandingPageDataService extends PickMeCoreApi{
  Future<JobsLandingPageEntity> getLandingPageData();
}