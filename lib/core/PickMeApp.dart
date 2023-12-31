
import 'dart:convert';

import 'package:pickme/firebase_options.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/main.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'locator/locator.dart';
import 'package:firebase_core/firebase_core.dart';


class PickMeApp{

  static Future<void> appInit(Environment env)async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await configFlavor(await readEnvironment(selectEnvironment(env)));
    await initHive();
    setupLocators();
    PickMeApp.run();
  }

  static void run(){
    AppRouter _appRouter = AppRouter();

    return runApp(
      MaterialApp.router(
       routerConfig: _appRouter.config(),
        localizationsDelegates:  const [
          AppLocalizations.delegate,
        ],
        themeMode: ThemeMode.system,
        darkTheme: ThemeData(

        ),
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,

        ),


      )
    );
  }
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
  return "environment/$environment";
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

configFlavor (Map<String,dynamic> data) {
  FlavorConfig(
      variables: data);
}