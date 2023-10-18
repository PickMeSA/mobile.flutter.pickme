

import 'dart:convert';

import 'package:app/core/service_locator/service_locator.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'constants.dart';
import 'locator.dart';

class PickMeApp  {

  static Future<void> appInit(Environment env) async{
    await WidgetsFlutterBinding.ensureInitialized();
    await configFlavor(await readEnvironment(selectEnvironment(env)));
    setupLocators();
    PickMeApp.run();
  }

  static void run(){
    final appRouter =  locator<AppRouter>();


    return runApp(
        MaterialApp.router(
          routerConfig: appRouter.config(),
          localizationsDelegates:  const [
            AppLocalizations.delegate,
          ],
          supportedLocales:  AppSupportedLocals.appSupportedLocals,
          // theme: AppThemeData.appThemeData,
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

configFlavor (Map<String,dynamic> data){
  FlavorConfig(
      name: data["name"],
      color:  Color(int.parse(data["color"])),
      variables: {
        "policy": data["policy"],
        "base_oauth_url":  data["base_oauth_url"],
        "oauth_url_suffix": data["oauth_url_suffix"],
        "oauth_version":  data["oauth_version"],
        "client_id": data["client_id"],
        "redirect_uri": data["redirect_uri"],
        "scope" : data["scope"],
        "response_type" : data["response_type"],
        "prompt" : data["prompt"],
        "code" : data["code"]
      }
  );
}