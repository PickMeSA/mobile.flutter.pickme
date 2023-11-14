import 'package:injectable/injectable.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/services/local/Hive/profile_local_storage/profile/profile_model.dart';
import 'package:pickme/shared/services/local/Hive/profile_local_storage/profile_local_storage.dart';

@Injectable(as: ProfileLocalStorage)
class ProfileLocalStorageImpl extends ProfileLocalStorage{
  @override
  Future<ProfileModel> getProfileModel() {
    if(boxProfile.isNotEmpty){
      return boxProfile.get(current);
    }else{
      throw("no profile saved");
    }
  }

  @override
  Future<void> setProfileDetails({required ProfileModel profileModel}) async {
    boxProfile.put(current, profileModel);
  }

}