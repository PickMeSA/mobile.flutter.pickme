
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pickme/main.dart';
import 'package:pickme/navigation/app_route.dart';

import 'locator/locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pickme/firebase_options.dart';

class PickMeApp{

  static Future<void> appInit(Environment env)async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    //await configflavor()
    setupLocators();
    PickMeApp.run();
  }

  static void run(){


    return runApp(
      MaterialApp.router(
       routerConfig: locator<AppRouter>().config(),

      )
    );
  }
}