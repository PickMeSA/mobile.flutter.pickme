import 'package:pickme/features/jobs/hiring/review_job_listing_details/domain/repository/create_job_listing_repository.dart';
import 'package:pickme/features/jobs/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/remote/PickMeApiCore.dart';

abstract class CreateJobListingService extends PickMeCoreApi{

  Future<JobEntity> createJob({required CreateJobListingRepositoryParams jobListingRepositoryParams});
}