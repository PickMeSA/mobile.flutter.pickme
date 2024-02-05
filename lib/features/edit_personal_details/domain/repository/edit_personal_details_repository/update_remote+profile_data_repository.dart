import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/features/register/domain/entities/user/user_model.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';

abstract class UpdateRemoteProfileDateRepository  extends BaseRepository<UpdateRemoteProfileDateRepositoryParams, UserEntity>{}

class UpdateRemoteProfileDateRepositoryParams extends BaseRepositoryParams{

  UserEntity userEntity;

  UpdateRemoteProfileDateRepositoryParams({required this.userEntity});
}
