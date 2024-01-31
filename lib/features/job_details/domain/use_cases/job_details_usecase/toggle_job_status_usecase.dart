
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/job_details/domain/repository/job_details_repository/get_full_job_details_repository.dart';
import 'package:pickme/features/job_details/domain/repository/job_details_repository/toggle_job_status_repository.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';

@Injectable()
class ToggleJobStatusUseCase extends BaseUseCase<ToggleJobStatusUseCaseParams, bool>{

  final ToggleJobStatusRepository toggleJobStatusRepository;

  ToggleJobStatusUseCase({required this.toggleJobStatusRepository});

  @override
  Future<bool> call({ToggleJobStatusUseCaseParams? params}) async{
   try{
     return await toggleJobStatusRepository.call(params: ToggleJobStatusRepositoryParams(status: params!.status, jobId: params.jobId) );
   }catch(ex){
     rethrow;
   }
  }
}

class ToggleJobStatusUseCaseParams extends BaseUseCaseParams{

  final String status;
  final String jobId;

  ToggleJobStatusUseCaseParams({required this.jobId, required this.status});
}
