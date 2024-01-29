import 'package:injectable/injectable.dart';
import 'package:pickme/features/jobs/applying/jobs_landing_page/data/service/get_jobs_landing_page_data_service.dart';
import 'package:pickme/features/jobs/applying/jobs_landing_page/domain/entities/jobs_landing_page_entity.dart';
import 'package:pickme/features/jobs/applying/jobs_landing_page/domain/repository/get_job_landing_page_data_repository.dart';

@Injectable(as: GetJobLandingPageDataRepository)
class GetJobLandingPageDataRepositoryImpl extends GetJobLandingPageDataRepository{
  final GetJobsLandingPageDataService service;

  GetJobLandingPageDataRepositoryImpl({required this.service});

  @override
  Future<JobsLandingPageEntity> call({GetJobLandingPageDataRepositoryParams? params}) async{
    try{
      return await service.getLandingPageData();
    }catch(ex){
      rethrow;
    }
  }
}
