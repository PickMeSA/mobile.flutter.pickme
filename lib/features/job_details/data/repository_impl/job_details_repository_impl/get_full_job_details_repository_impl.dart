import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/job_details/domain/repository/job_details_repository/get_full_job_details_repository.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/services/remote/api_service/jobs_service/jobs_service.dart';

@Injectable(as: GetJobFullDetailsRepository)
class GetJobFullDetailsRepositoryImpl extends GetJobFullDetailsRepository {
  final JobService jobService;
  GetJobFullDetailsRepositoryImpl({required this.jobService});

  @override
  Future<JobEntity> call({GetJobFullDetailsRepositoryParams? params})async {
   try{
     return await jobService.getJobFullDetails(jobid: params!.jobId);
   }catch(ex){
     rethrow;
   }
  }

}
