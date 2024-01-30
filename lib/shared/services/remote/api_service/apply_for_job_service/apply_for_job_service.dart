import 'package:pickme/shared/domain/repository/apply_for_job_repository.dart';
import 'package:pickme/shared/remote/PickMeApiCore.dart';

abstract class ApplyForJobService extends PickMeCoreApi{

  Future<bool> applyForJob({required ApplyForJobRepositoryParams params});
  Future<bool> updateJobInterestStatus({required String jobInterestId, required String status});
}