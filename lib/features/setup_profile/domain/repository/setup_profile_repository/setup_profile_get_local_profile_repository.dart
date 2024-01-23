import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/shared/services/local/Hive/profile_local_storage/profile/profile_model.dart';

abstract class SetupProfileGetLocalProfileRepository  extends BaseRepository<SetupProfileGetLocalProfileRepositoryParams, ProfileModel>{}

class SetupProfileGetLocalProfileRepositoryParams extends BaseRepositoryParams{}
