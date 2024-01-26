import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';

abstract class ApplyForJobRepository  extends BaseRepository<ApplyForJobRepositoryParams, bool>{}

class ApplyForJobRepositoryParams extends BaseRepositoryParams{
  final JobEntity jobEntity;
  final String userId;
  ApplyForJobRepositoryParams({required this.jobEntity, required this.userId});
}
