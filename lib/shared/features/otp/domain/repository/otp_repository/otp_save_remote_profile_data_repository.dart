import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/features/register/domain/entities/user/user_model.dart';

abstract class OTPSaveRemoteProfileDataRepository  extends BaseRepository<OTPSaveRemoteProfileDataRepositoryParams, UserEntity>{}

class OTPSaveRemoteProfileDataRepositoryParams extends BaseRepositoryParams{
  final UserEntity userModel;

  OTPSaveRemoteProfileDataRepositoryParams({required this.userModel});
}
