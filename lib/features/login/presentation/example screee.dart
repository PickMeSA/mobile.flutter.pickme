import 'package:app/bases/bloc_base_classes/base_bloc.dart';
import 'package:app/bases/bloc_base_classes/base_event.dart';
import 'package:app/bases/bloc_base_classes/base_page.dart';
import 'package:app/bases/bloc_base_classes/base_state.dart';
import 'package:app/core/service_locator/service_locator.dart';
import 'package:app/features/login/presentation/bloc/login_bloc.dart';
import 'package:app/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends BasePage {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends BasePageState<LoginScreen, LoginBloc> {

  @override
  void initState() {
    super.initState();
    getBloc().add(SelectLoginEvent(passWord: "Password", userName: "Username"));
  }
  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer(builder:(context, state){
      return state is SelectLoginState && state.dataState == DataState.loading?
          const CircularProgressIndicator():
          Container();
    }, listener: (context, state){
        if(state is SelectLoginState && state.dataState == DataState.success){
        }
          //MOVE TO NEXT PAGE
    });
  }

  @override
  BaseBloc<BaseEvent, BaseState> initBloc() {
    return locator<LoginBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    // TODO: implement initLocalization
    throw UnimplementedError();
  }

}
