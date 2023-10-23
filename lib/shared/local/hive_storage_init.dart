
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pickme/features/login/domain/entities/app_state/app_state_model.dart';
import 'package:pickme/features/login/domain/entities/biometrics/biometrics_model.dart';
import 'package:pickme/features/login/domain/entities/token/token_model.dart';


initHive() async {
  await Hive.initFlutter();
  registerAdapters();
  await openBoxes();
}

registerAdapters() {
  Hive.registerAdapter(TokenModelAdapter());
  Hive.registerAdapter(AppStateModelAdapter());
  Hive.registerAdapter(BiometricsModelAdapter());
}

openBoxes() async {
  boxTokens = await Hive.openBox(tokenBox);
  boxAppState = await Hive.openBox(appStateBox);
  boxBiometrics = await Hive.openBox(biometricsBox);
}

late Box boxTokens;
late Box boxAppState;
late Box boxBiometrics;

const String tokenBox = "TokenBox";
const String appStateBox = "AppStateBox";
const String current = "CURRENT";
const String biometricsBox = "BiometricsBox";
