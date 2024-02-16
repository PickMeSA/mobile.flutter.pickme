
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/edit_personal_details/domain/repository/edit_personal_details_repository/update_remote+profile_data_repository.dart';
import 'package:pickme/features/register/domain/entities/user/user_model.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';

@Injectable()
class UpdateRemoteProfileDateUseCase extends BaseUseCase<UpdateRemoteProfileDateUseCaseParams, UserEntity>{

  final UpdateRemoteProfileDateRepository updateRemoteProfileDateRepository;

  UpdateRemoteProfileDateUseCase({required this.updateRemoteProfileDateRepository});

  @override
  Future<UserEntity> call({UpdateRemoteProfileDateUseCaseParams? params}) async{
  try{
    return await updateRemoteProfileDateRepository.call(params: UpdateRemoteProfileDateRepositoryParams(userEntity: params!.userEntity));
  }catch(ex){
    rethrow;
  }
  }
}

class UpdateRemoteProfileDateUseCaseParams extends BaseUseCaseParams{

  UserEntity userEntity;

  UpdateRemoteProfileDateUseCaseParams({required this.userEntity});
}
