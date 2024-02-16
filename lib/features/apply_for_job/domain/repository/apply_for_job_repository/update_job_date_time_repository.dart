import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/features/apply_for_job/domain/entities/date_and_time.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';

abstract class UpdateJobDateTimeRepository  extends BaseRepository<UpdateJobDateTimeRepositoryParams, bool>{}

class UpdateJobDateTimeRepositoryParams extends BaseRepositoryParams{
  final JobEntity jobEntity;
  final DateAndTime dateAndTime;

  UpdateJobDateTimeRepositoryParams({required this.jobEntity, required  this.dateAndTime});
}
