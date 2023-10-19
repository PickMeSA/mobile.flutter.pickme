import 'package:auto_route/auto_route.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/core/locator/locator.config.dart';
import 'package:pickme/localization/generated/l10n.dart';

GetIt locator = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: false,
  asExtension: true,
)

void setupLocators()=> locator.init();


@module
abstract class RegisterModule{

  AutoRoute get  autoRoute;

  AppLocalizations get appLocalizations;
}