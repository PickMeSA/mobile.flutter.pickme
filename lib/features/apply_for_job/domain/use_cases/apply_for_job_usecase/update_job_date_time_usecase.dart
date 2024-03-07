
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/apply_for_job/domain/entities/date_and_time.dart';
import 'package:pickme/features/apply_for_job/domain/repository/apply_for_job_repository/update_job_date_time_repository.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';

@Injectable()
class UpdateJobDateTimeUseCase extends BaseUseCase<UpdateJobDateTimeUseCaseParams, bool>{

  final UpdateJobDateTimeRepository updateJobDateTimeRepository;

  UpdateJobDateTimeUseCase({required this.updateJobDateTimeRepository});

  @override
  Future<bool> call({UpdateJobDateTimeUseCaseParams? params}) async{
    try{
      return await updateJobDateTimeRepository.call(params: UpdateJobDateTimeRepositoryParams(jobEntity: params!.jobEntity, dateAndTime:  params!.dateAndTime));
    }catch(ex){
      logger.e(ex);
      rethrow;
    }
  }
}

class UpdateJobDateTimeUseCaseParams extends BaseUseCaseParams{
  final JobEntity jobEntity;
  final DateAndTime dateAndTime;

  UpdateJobDateTimeUseCaseParams({required this.jobEntity, required this.dateAndTime});
}
