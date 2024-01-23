
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/setup_profile/domain/entities/profile_type_entity.dart';
import 'package:pickme/features/setup_profile/domain/repository/setup_profile_repository/setup_profile_remote_submit_profile_type__repository.dart';

@Injectable()
class SetupProfileRemoteSubmitProfileTypeUseCase extends BaseUseCase<SetupProfileRemoteSubmitProfileTypeUseCaseParams, bool>{

  final SetupProfileRemoteSubmitProfileTypeRepository setupProfileRemoteSubmitProfileTypeRepository;

  SetupProfileRemoteSubmitProfileTypeUseCase({required this.setupProfileRemoteSubmitProfileTypeRepository});

  @override
  Future<bool> call({SetupProfileRemoteSubmitProfileTypeUseCaseParams? params}) {
    try{
      return setupProfileRemoteSubmitProfileTypeRepository.call(
          params: SetupProfileRemoteSubmitProfileTypeRepositoryParams(
              profileTypeEntity: params!.profileTypeEntity!));
    }catch(ex){
      rethrow;
    }
  }
}

class SetupProfileRemoteSubmitProfileTypeUseCaseParams extends BaseUseCaseParams{
  ProfileTypeEntity profileTypeEntity;

  SetupProfileRemoteSubmitProfileTypeUseCaseParams({required this.profileTypeEntity});
}
