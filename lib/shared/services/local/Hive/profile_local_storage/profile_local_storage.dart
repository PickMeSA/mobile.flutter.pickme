import 'package:pickme/shared/services/local/Hive/profile_local_storage/profile/profile_model.dart';

abstract class ProfileLocalStorage {

  Future<void> setProfileDetails({required ProfileModel profileModel});

  Future<ProfileModel> getProfileModel();
}