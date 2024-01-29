import 'package:injectable/injectable.dart';

import '../../domain/entities/jobs_landing_page_entity.dart';
import '../../domain/repository/get_job_landing_page_data_repository.dart';
import '../service/get_jobs_landing_page_data_service.dart';

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
