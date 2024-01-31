import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';

abstract class ToggleJobStatusRepository  extends BaseRepository<ToggleJobStatusRepositoryParams, bool>{}

class ToggleJobStatusRepositoryParams extends BaseRepositoryParams{
  final String status;
  final String jobId;

  ToggleJobStatusRepositoryParams({required this.jobId, required this.status});
}
