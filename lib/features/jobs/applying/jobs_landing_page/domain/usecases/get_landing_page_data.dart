
import 'package:injectable/injectable.dart';
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:pickme/features/jobs/applying/jobs_landing_page/domain/entities/jobs_landing_page_entity.dart';
import 'package:pickme/features/jobs/applying/jobs_landing_page/domain/repository/get_job_landing_page_data_repository.dart';

@Injectable()
class GetJobLandingPageDataUseCase extends BaseUseCase<GetJobLandingPageDataUseCaseParams, JobsLandingPageEntity>{

  final GetJobLandingPageDataRepository getJobLandingPageDataRepository;

  GetJobLandingPageDataUseCase({required this.getJobLandingPageDataRepository});

  @override
  Future<JobsLandingPageEntity> call({GetJobLandingPageDataUseCaseParams? params}) async {
    try{
      return await getJobLandingPageDataRepository.call();
    }catch(ex){
      rethrow;
    }
  }
}

class GetJobLandingPageDataUseCaseParams extends BaseUseCaseParams{
  GetJobLandingPageDataUseCaseParams();
}