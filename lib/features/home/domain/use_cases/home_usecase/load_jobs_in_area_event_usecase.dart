
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/home/domain/repository/home_repository/load_jobs_in_area_event_repository.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/domain/entities/lat_long_entity.dart';

@Injectable()
class LoadJobsInAreaEventUseCase extends BaseUseCase<LoadJobsInAreaEventUseCaseParams, List<JobEntity>>{

  final LoadJobsInAreaEventRepository loadJobsInAreaEventRepository;

  LoadJobsInAreaEventUseCase({required this.loadJobsInAreaEventRepository});

  @override
  Future<List<JobEntity>> call({LoadJobsInAreaEventUseCaseParams? params}) async {
    try{
      return await loadJobsInAreaEventRepository.call(params: LoadJobsInAreaEventRepositoryParams(latLongEntity: params!.latLongEntity));
    }catch(ex){
      rethrow;
    }
  }
}

class LoadJobsInAreaEventUseCaseParams extends BaseUseCaseParams{

  final LatLongEntity latLongEntity;

  LoadJobsInAreaEventUseCaseParams({required this.latLongEntity});
}
