import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/setup_profile/domain/repository/setup_profile_repository/setup_profile_get_local_profile_repository.dart';
import 'package:pickme/shared/services/local/Hive/profile_local_storage/profile/profile_model.dart';
import 'package:pickme/shared/services/local/Hive/profile_local_storage/profile_local_storage.dart';

@Injectable(as: SetupProfileGetLocalProfileRepository)
class SetupProfileGetLocalProfileRepositoryImpl extends SetupProfileGetLocalProfileRepository {
  final ProfileLocalStorage profileLocalStorage;
  SetupProfileGetLocalProfileRepositoryImpl({required this.profileLocalStorage});

  @override
  Future<ProfileModel> call({SetupProfileGetLocalProfileRepositoryParams? params}) async {
   return await profileLocalStorage.getProfileModel();
  }

}
