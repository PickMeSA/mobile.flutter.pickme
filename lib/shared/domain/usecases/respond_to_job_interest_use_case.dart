
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/domain/repository/apply_for_job_repository.dart';
import '../repository/get_my_job_listings_repository.dart';
import '../repository/respond_to_job_interest_repository.dart';


@Injectable()
class RespondToJobInterestUseCase extends BaseUseCase<RespondToJobInterestUseCaseParams, bool>{

  final RespondToJobInterestRepository respondToJobInterestRepository;

  RespondToJobInterestUseCase({required this.respondToJobInterestRepository});

  @override
  Future<bool> call({RespondToJobInterestUseCaseParams? params}) async {
   try{
     return await respondToJobInterestRepository.call(params: RespondToJobInterestRepositoryParams(jobInterestId: params!.jobInterestId, status: params.status));
   }catch(ex){
     rethrow;
   }
  }
}

class RespondToJobInterestUseCaseParams extends BaseUseCaseParams{
  final String jobInterestId;
  final String status;
  RespondToJobInterestUseCaseParams({required this.jobInterestId, required this.status});
}
