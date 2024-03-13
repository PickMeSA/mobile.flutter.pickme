import 'package:pickme/shared/services/local/Hive/profile_local_storage/profile/profile_model.dart';

abstract class ProfileLocalStorage {

  void setProfileDetails({required ProfileModel profileModel});

  ProfileModel getProfileModel();

  void clearProfile();
}