import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/job_details/domain/repository/job_details_repository/get_full_job_details_repository.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/services/remote/api_service/jobs_service/jobs_service.dart';

import '../../../domain/repository/job_details_repository/toggle_job_status_repository.dart';

@Injectable(as: ToggleJobStatusRepository)
class ToggleJobStatusRepositoryImpl extends ToggleJobStatusRepository {
  final JobService jobService;
  ToggleJobStatusRepositoryImpl({required this.jobService});

  @override
  Future<bool> call({ToggleJobStatusRepositoryParams? params})async {
   try{
     return await jobService.updateJobStatus(jobId: params!.jobId, status: params.status);
   }catch(ex){
     rethrow;
   }
  }

}
