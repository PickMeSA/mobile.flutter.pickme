import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/features/setup_profile/domain/entities/profile_type_entity.dart';

abstract class SetupProfileRemoteSubmitProfileTypeRepository  extends BaseRepository<SetupProfileRemoteSubmitProfileTypeRepositoryParams, bool>{}

class SetupProfileRemoteSubmitProfileTypeRepositoryParams extends BaseRepositoryParams{
  ProfileTypeEntity profileTypeEntity;

  SetupProfileRemoteSubmitProfileTypeRepositoryParams({required this.profileTypeEntity});
}
