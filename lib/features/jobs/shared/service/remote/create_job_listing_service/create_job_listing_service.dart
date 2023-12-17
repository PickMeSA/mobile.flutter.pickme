import 'package:pickme/features/jobs/hiring/create_job_listing/domain/repository/create_job_listing_repository.dart';
import 'package:pickme/features/jobs/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/remote/PickMeApiCore.dart';

abstract class CreateJobListingService extends PickMeCoreApi{

  Future<JobEntity> createJob({required CreateJobListingRepositoryParams jobListingRepositoryParams});
}