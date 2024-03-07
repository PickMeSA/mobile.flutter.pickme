
import 'dart:convert';
import 'dart:io';

import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';
import 'package:pickme/firebase_options.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/main.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:secure_shared_preferences/secure_shared_pref.dart';
import 'locator/locator.dart';
import 'package:firebase_core/firebase_core.dart';


class PickMeApp{

  static Future<void> appInit(Environment env)async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await saveBaseUrls();
    await configFlavor(await readEnvironment(selectEnvironment(env)));
    await initHive();
    setupLocators();
    if(Platform.isAndroid) {
      AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
    }
    PickMeApp.run();
  }

  static void run(){
    AppRouter _appRouter = AppRouter();
    MediaQueryData windowData =
    MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
    windowData = windowData.copyWith(
      textScaleFactor:
      windowData.textScaleFactor > 1 ? 1 : windowData.textScaleFactor,
    );

    return runApp(
      MediaQuery(
        data: windowData,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
         routerConfig: _appRouter.config(),
          localizationsDelegates:  const [
            AppLocalizations.delegate,
          ],
          themeMode: ThemeMode.system,
          darkTheme: AppTheme().defaultTheme,
          theme: AppTheme().defaultTheme,


        ),
      )
    );
  }
}
saveBaseUrls()async {
  var pref = await SecureSharedPref.getInstance();
  //save environment to secure shared preferences
  Map<String, dynamic> devEnvData = await readEnvironment(selectEnvironment(Environment.dev));
  pref.putString("dev_base_url", devEnvData["digital_oceans"]["base_url"], isEncrypted : true);
  pref.putString("dev_api_version", devEnvData["digital_oceans"]["version"], isEncrypted : true);
  Map<String, dynamic> uatEnvData = await readEnvironment(selectEnvironment(Environment.dev));
  pref.putString("uat_base_url", uatEnvData["digital_oceans"]["base_url"], isEncrypted : true);
  pref.putString("uat_api_version", uatEnvData["digital_oceans"]["version"], isEncrypted : true);
  Map<String, dynamic> prodEnvData = await readEnvironment(selectEnvironment(Environment.prod));
  pref.putString("prod_base_url", prodEnvData["digital_oceans"]["base_url"], isEncrypted : true);
  pref.putString("prod_api_version", prodEnvData["digital_oceans"]["version"], isEncrypted : true);
}
String selectEnvironment(Environment env)  {
  String environment = "";

  switch (env) {
    case Environment.dev :
      environment = "development.json";
      break;
    case Environment.uat :
      environment = "user_accceptance.json";
      break;
    case Environment.prod :
      environment = "production.json";
      break;
    default :
      environment = "development.json";
  }
  return "environments/$environment";
}

Future<Map<String, dynamic>> readEnvironment(String uri)async{
  try{
    final String response = await rootBundle.loadString(uri);
    final Map<String,dynamic> data = await json.decode(response);
    return data;
  }catch(ex){
    return {"error": ex.toString()};
  }
}
Future<void> initAPIEnvironment(Map<String,dynamic> data) async{
  var pref = await SecureSharedPref.getInstance();
  pref.putString("base_url", data["digital_oceans"]["base_url"], isEncrypted : true);
  pref.putString("api_version", data["digital_oceans"]["version"], isEncrypted : true);
}

configFlavor (Map<String,dynamic> data) async  {
  logger.d(data);
  await initAPIEnvironment(data);
  var pref = await SecureSharedPref.getInstance();
  var base_url = await pref.getString("base_url", isEncrypted : true);

  logger.d(base_url);
  FlavorConfig(
      variables: data);
}