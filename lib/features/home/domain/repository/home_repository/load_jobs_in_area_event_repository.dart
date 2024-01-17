import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/domain/entities/lat_long_entity.dart';

abstract class LoadJobsInAreaEventRepository  extends BaseRepository<LoadJobsInAreaEventRepositoryParams, List<JobEntity>>{}

class LoadJobsInAreaEventRepositoryParams extends BaseRepositoryParams{

  final LatLongEntity latLongEntity;

  LoadJobsInAreaEventRepositoryParams({required this.latLongEntity});
}
