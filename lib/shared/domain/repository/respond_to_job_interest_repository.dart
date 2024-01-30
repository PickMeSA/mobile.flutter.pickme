import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';

abstract class RespondToJobInterestRepository  extends BaseRepository<RespondToJobInterestRepositoryParams, bool>{}

class RespondToJobInterestRepositoryParams extends BaseRepositoryParams{
  final String jobInterestId;
  final String status;
  RespondToJobInterestRepositoryParams({required this.jobInterestId, required this.status});
}
