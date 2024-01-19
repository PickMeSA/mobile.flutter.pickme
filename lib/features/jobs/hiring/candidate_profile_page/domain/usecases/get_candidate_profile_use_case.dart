
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/jobs/hiring/candidate_profile_page/domain/repository/get_candidate_profile_repository.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';

@Injectable()
class GetCandidateProfileUseCase extends BaseUseCase<GetCandidateProfileUseCaseParams, ProfileEntity>{

  final GetCandidateProfileRepository getRemoteProfileRepository;

  GetCandidateProfileUseCase({required this.getRemoteProfileRepository});

  @override
  Future<ProfileEntity> call({GetCandidateProfileUseCaseParams? params})  async{
    try{
      return await getRemoteProfileRepository.call(params: GetCandidateProfileRepositoryParams(id: params!.id));
    }catch(ex){
      rethrow;
    }
  }
}

class GetCandidateProfileUseCaseParams extends BaseUseCaseParams{
  final String id;
  GetCandidateProfileUseCaseParams({required this.id});
}
