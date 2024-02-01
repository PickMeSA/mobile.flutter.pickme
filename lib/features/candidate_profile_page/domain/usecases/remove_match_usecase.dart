
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/candidate_profile_page/domain/repository/remove_match_repository.dart';

@Injectable()
class RemoveMatchUseCase extends BaseUseCase<RemoveMatchUseCaseParams, bool>{

  final RemoveMatchRepository removeMatchRepository;

  RemoveMatchUseCase({required this.removeMatchRepository});

  @override
  Future<bool> call({RemoveMatchUseCaseParams? params})  async{
    try{
      return await removeMatchRepository.call(params: RemoveMatchRepositoryParams(jobId: params!.jobId, userIds: params.userIds));
    }catch(ex){
      rethrow;
    }
  }
}

class RemoveMatchUseCaseParams extends BaseUseCaseParams{
  final String jobId;
  final String userIds;
  RemoveMatchUseCaseParams({required this.jobId, required this.userIds});
}
