import 'package:pickme/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'base_bloc.dart';
import 'base_state.dart';

abstract class BaseMultiBlocWidget extends StatefulWidget{
  const BaseMultiBlocWidget({Key? key}) : super(key:key);
}

abstract class BaseMultiBlocWidgetState<T extends BaseMultiBlocWidget , B extends BaseBloc, B1 extends BaseBloc > extends State<T>{
  late B baseBloc;
  late B1 secondBloc;
  late AppLocalizations baseLocalization;

  @mustCallSuper
  void onBlocStateChanged(BaseBlocPrimaryState state) => state.call(context);

  @override
  void initState() {
    baseLocalization = initLocalization();
    baseBloc = initBloc();
    secondBloc = initSecondBloc();
    baseBloc.baseState?.listen(onBlocStateChanged);
    super.initState();
  }

  B getBloc() => baseBloc;
  B1 getSecondBloc() => secondBloc;

  B initBloc();
  B1 initSecondBloc();


  AppLocalizations initLocalization();

  AppLocalizations getLocalization() => baseLocalization;

  @override
  void dispose(){
    getBloc().dispose();
    getSecondBloc().dispose();
    super.dispose();
  }
}