import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/features/jobs/shared/domain/entities/create_job_page_job_entity.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';

abstract class CreateJobListingRepository  extends BaseRepository<CreateJobListingRepositoryParams, JobEntity>{}

class CreateJobListingRepositoryParams extends BaseRepositoryParams{
  final CreateJobPageJobEntity jobEntity;
  CreateJobListingRepositoryParams({required this.jobEntity});
}
