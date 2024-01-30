import 'package:injectable/injectable.dart';
import 'package:pickme/shared/domain/repository/apply_for_job_repository.dart';
import 'package:pickme/shared/domain/repository/respond_to_job_interest_repository.dart';
import 'package:pickme/shared/services/remote/api_service/apply_for_job_service/apply_for_job_service.dart';

@Injectable(as: RespondToJobInterestRepository)
class RespondToJobInterestRepositoryImpl  extends RespondToJobInterestRepository{
  final ApplyForJobService service;

  RespondToJobInterestRepositoryImpl({required this.service});
  @override
  Future<bool> call({RespondToJobInterestRepositoryParams? params}) {
    return service.updateJobInterestStatus(status: params!.status, jobInterestId: params.jobInterestId);
  }

}