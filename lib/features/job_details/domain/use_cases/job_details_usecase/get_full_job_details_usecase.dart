
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/job_details/domain/repository/job_details_repository/get_full_job_details_repository.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';

@Injectable()
class GetJobFullDetailsUseCase extends BaseUseCase<GetJobFullDetailsUseCaseParams, JobEntity>{

  final GetJobFullDetailsRepository getJobFullDetailsRepository;

  GetJobFullDetailsUseCase({required this.getJobFullDetailsRepository});

  @override
  Future<JobEntity> call({GetJobFullDetailsUseCaseParams? params}) async{
   try{
     return await getJobFullDetailsRepository.call(params: GetJobFullDetailsRepositoryParams(jobId: params!.jobId) );
   }catch(ex){
     rethrow;
   }
  }
}

class GetJobFullDetailsUseCaseParams extends BaseUseCaseParams{

  final String jobId;

  GetJobFullDetailsUseCaseParams({required this.jobId});
}
