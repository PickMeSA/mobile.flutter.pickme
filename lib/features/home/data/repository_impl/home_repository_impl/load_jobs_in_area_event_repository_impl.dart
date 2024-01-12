import 'package:injectable/injectable.dart';
import 'package:pickme/features/home/domain/repository/home_repository/load_jobs_in_area_event_repository.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/services/remote/api_service/jobs_service/jobs_service.dart';

@Injectable(as: LoadJobsInAreaEventRepository)
class LoadJobsInAreaEventRepositoryImpl extends LoadJobsInAreaEventRepository {
  final JobService jobService;
  LoadJobsInAreaEventRepositoryImpl({required this.jobService});

  @override
  Future<List<JobEntity>> call({LoadJobsInAreaEventRepositoryParams? params}) async {
    try{
      return await jobService.getJobsInArea(latLongEntity: params!.latLongEntity);
    }catch(ex){
      rethrow;
    }
  }

}
