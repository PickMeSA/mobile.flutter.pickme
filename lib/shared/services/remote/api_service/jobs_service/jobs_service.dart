import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/domain/entities/lat_long_entity.dart';
import 'package:pickme/shared/remote/PickMeApiCore.dart';

abstract class JobService extends PickMeCoreApi{

  Future<JobEntity> getJobFullDetails({required String jobid});

  Future<List<JobEntity>> getJobsInArea({required LatLongEntity latLongEntity});
  Future<bool> removePotentialMatches({required String jobId, required String commaSeparatedIds});
}