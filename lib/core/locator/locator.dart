
import 'package:pickme/core/locator/locator.config.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

GetIt locator = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)

void setupLocators()=> locator.init();


@module
abstract class RegisterModule{


  AppLocalizations get appLocalizations => AppLocalizations();

  Dio get dio => Dio();
  @singleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
}