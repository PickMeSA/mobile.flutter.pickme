import 'package:pickme/features/apply_for_job/domain/entities/date_and_time.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/domain/entities/lat_long_entity.dart';
import 'package:pickme/shared/models/jobs/my_job_listings_job_model_response.dart';
import 'package:pickme/shared/remote/PickMeApiCore.dart';

abstract class JobService extends PickMeCoreApi{

  Future<JobEntity> getJobFullDetails({required String jobid});

  Future<List<JobEntity>> getJobsInArea({required LatLongEntity latLongEntity});
  Future<bool> removePotentialMatches({required String jobId, required String commaSeparatedIds});
  Future<bool> updateJobStatus({required String jobId, required String status});
  Future<bool> updateJobDateTime({required JobEntity jobEntity, required DateAndTime dateAndTime});
  Future<bool>updateJobInterestDateTime({required JobEntity jobEntity, required   DateAndTime dateAndTime});
}