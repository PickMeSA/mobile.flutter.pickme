
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/setup_profile/domain/repository/setup_profile_repository/setup_profile_get_local_profile_repository.dart';
import 'package:pickme/shared/services/local/Hive/profile_local_storage/profile/profile_model.dart';

@Injectable()
class SetupProfileGetLocalProfileUseCase extends BaseUseCase<SetupProfileGetLocalProfileUseCaseParams, ProfileModel>{

  final SetupProfileGetLocalProfileRepository setupProfileGetLocalProfileRepository;

  SetupProfileGetLocalProfileUseCase({required this.setupProfileGetLocalProfileRepository});

  @override
  Future<ProfileModel> call({SetupProfileGetLocalProfileUseCaseParams? params}) async{
    try{
      return await setupProfileGetLocalProfileRepository.call();
    }catch(ex){
      rethrow;
    }
  }
}

class SetupProfileGetLocalProfileUseCaseParams extends BaseUseCaseParams{}
