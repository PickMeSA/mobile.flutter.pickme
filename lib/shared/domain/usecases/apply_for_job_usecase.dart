
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/domain/repository/apply_for_job_repository.dart';
import '../repository/get_my_job_listings_repository.dart';


@Injectable()
class ApplyForJobUseCase extends BaseUseCase<ApplyForJobUseCaseParams, bool>{

  final ApplyForJobRepository applyForJobRepository;

  ApplyForJobUseCase({required this.applyForJobRepository});

  @override
  Future<bool> call({ApplyForJobUseCaseParams? params}) async {
   try{
     return await applyForJobRepository.call(params: ApplyForJobRepositoryParams(jobEntity: params!.jobEntity, userId: params.userId));
   }catch(ex){
     rethrow;
   }
  }
}

class ApplyForJobUseCaseParams extends BaseUseCaseParams{
  final JobEntity jobEntity;
  final String userId;
  ApplyForJobUseCaseParams({required this.jobEntity, required this.userId});
}
