import 'package:flutter/material.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/login/presentation/bloc/login_bloc.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/annotations.dart';

@RoutePage()
class LoginPage extends BasePage {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BasePageState<LoginPage, LoginBloc> {
  @override
  Widget buildView(BuildContext context) {
   return Column(
     children: [],
   );
  }

  @override
  LoginBloc initBloc() {
    return locator<LoginBloc>();
  }

  @override
  AppLocalizations initLocalization() {
   return locator<AppLocalizations>();
  }

}
