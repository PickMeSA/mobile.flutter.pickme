import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';

abstract class GetJobFullDetailsRepository  extends BaseRepository<GetJobFullDetailsRepositoryParams, JobEntity>{}

class GetJobFullDetailsRepositoryParams extends BaseRepositoryParams{
  final String jobId;

  GetJobFullDetailsRepositoryParams({required this.jobId});
}
