
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/login/domain/entities/app_state/app_state_model.dart';
import 'package:pickme/features/login/domain/entities/biometrics/biometrics_model.dart';
import 'package:pickme/features/login/domain/entities/token/token_model.dart';
import 'package:pickme/shared/services/local/Hive/profile_local_storage/profile/profile_model.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';
import 'package:pickme/shared/services/local/Hive/user_type_local_storage/user_type_model.dart';

@Singleton()
class HiveLocalStorage{

  initHive() async {
    await Hive.initFlutter();
    registerAdapters();
    await openBoxes();
  }

  registerAdapters() {
    Hive.registerAdapter(TokenModelAdapter());
    Hive.registerAdapter(AppStateModelAdapter());
    Hive.registerAdapter(BiometricsModelAdapter());
    Hive.registerAdapter(ProfileModelAdapter());
    Hive.registerAdapter(UserModelAdapter());
    // Hive.registerAdapter(UserTypeModelAdapter());
  }

  openBoxes() async {
    _boxTokens = await Hive.openBox(BoxNames.TokenBox.toString());
    boxAppState = await Hive.openBox(BoxNames.AppStateBox.toString());
    boxBiometrics = await Hive.openBox(BoxNames.BiometricsBox.toString());
    _boxProfile = await Hive.openBox(BoxNames.ProfileBox.toString());
    _boxUser = await Hive.openBox(BoxNames.UserBox.toString());
    boxSyncData = await Hive.openBox(BoxNames.SyncBox.toString());
    _boxUserType = await Hive.openBox(BoxNames.UserTypeBox.toString());
  }
// ToDo: Add a data source singleton for the user boxes below
  late Box _boxTokens;
  late Box boxAppState;
  late Box boxBiometrics;
  late Box _boxProfile;
  late Box _boxUser;
  late Box boxSyncData;
  late Box _boxUserType;

// ToDo: Add unit tests for the below
// Verify that these names are unique
// Verify that the wanted name is whats there

  getBoxTokens(){
    return _boxTokens;
  }
  getBoxProfile(){
    return _boxProfile;
  }
  setBoxProfile(ProfileModel profileModel){
    _boxProfile.put(BoxNames.CURRENT.toString(), profileModel);
  }
  getBoxBiometrics(){
    return boxBiometrics;
  }
  setBoxBiometrics(biometrics){
    boxBiometrics.put(BoxNames.CURRENT.toString(), biometrics);
  }
  setBoxTokens(token){
    _boxTokens.put(BoxNames.CURRENT.toString(), token);
  }
  setBoxUser(UserModel user){
    _boxUser.put(BoxNames.CURRENT.toString(), user);
  }
  setBoxUserType(UserTypeModel userTypeModel){
    _boxUserType.put(BoxNames.CURRENT.toString(), userTypeModel);
  }
  getBoxUser(){
    return _boxUser;
  }
  getBoxUserType(){
    return _boxUserType;
  }
}
enum BoxNames { TokenBox, AppStateBox, CURRENT, BiometricsBox, ProfileBox, SyncBox,
  UserBox, UserTypeBox}
