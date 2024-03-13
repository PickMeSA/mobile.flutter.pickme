import 'package:injectable/injectable.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/services/local/Hive/profile_local_storage/profile/profile_model.dart';
import 'package:pickme/shared/services/local/Hive/profile_local_storage/profile_local_storage.dart';

@Singleton(as: ProfileLocalStorage)
class ProfileLocalStorageHiveImpl extends ProfileLocalStorage{
  final HiveLocalStorage hiveLocalStorage;
  ProfileLocalStorageHiveImpl({required this.hiveLocalStorage});

  @override
  ProfileModel getProfileModel() {
    if(hiveLocalStorage.getBoxProfile().isNotEmpty){
      return hiveLocalStorage.getBoxProfile().get(BoxNames.CURRENT.toString());
    }
    throw("no profile saved");
  }

  @override
  void clearProfile() {
    hiveLocalStorage.getBoxProfile().clear();
  }

  @override
  void setProfileDetails({required ProfileModel profileModel}) {
    hiveLocalStorage.setBoxProfile(profileModel);
  }

}