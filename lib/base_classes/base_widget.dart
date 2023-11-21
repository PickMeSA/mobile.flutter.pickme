import 'package:pickme/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'base_bloc.dart';
import 'base_state.dart';

abstract class BaseWidget extends StatefulWidget{
  const BaseWidget({Key? key}) : super(key:key);
}

abstract class BaseWidgetState<T extends BaseWidget , B extends BaseBloc > extends State<T>{
  late B baseBloc;
  late AppLocalizations baseLocalization;

  @mustCallSuper
  void onBlocStateChanged(BaseBlocPrimaryState state) => state.call(context);

  @override
  void initState() {
    baseLocalization = initLocalization();
    baseBloc = initBloc();
    baseBloc.baseState?.listen(onBlocStateChanged);
    super.initState();
  }

  B getBloc() => baseBloc;

  B initBloc();


  AppLocalizations initLocalization();

  AppLocalizations getLocalization() => baseLocalization;

  @override
  void dispose(){
    getBloc().dispose();
    super.dispose();
  }
}