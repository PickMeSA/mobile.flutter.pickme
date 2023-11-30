
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pickme/features/login/domain/entities/app_state/app_state_model.dart';
import 'package:pickme/features/login/domain/entities/biometrics/biometrics_model.dart';
import 'package:pickme/features/login/domain/entities/token/token_model.dart';
import 'package:pickme/shared/services/local/Hive/profile_local_storage/profile/profile_model.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';


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
}

openBoxes() async {
  boxTokens = await Hive.openBox(tokenBox);
  boxAppState = await Hive.openBox(appStateBox);
  boxBiometrics = await Hive.openBox(biometricsBox);
  boxProfile = await Hive.openBox(profileBox);
  boxUser = await Hive.openBox(userBox);
  boxSyncData = await Hive.openBox(syncBox);
}

late Box boxTokens;
late Box boxAppState;
late Box boxBiometrics;
late Box boxProfile;
late Box boxUser;
late Box boxSyncData;

const String tokenBox = "TokenBox";
const String appStateBox = "AppStateBox";
const String current = "CURRENT";
const String biometricsBox = "BiometricsBox";
const String profileBox = "ProfileBox";
const String syncBox = "SyncBox";
const String userBox = "UserBox";
