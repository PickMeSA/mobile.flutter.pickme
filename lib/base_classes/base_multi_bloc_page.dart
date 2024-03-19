import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'base_bloc.dart';
import 'base_multi_bloc_widget.dart';
import 'base_widget.dart';

abstract class BaseMultiBlocPage extends BaseMultiBlocWidget{
  const BaseMultiBlocPage({Key? key}) : super(key:key);
}

abstract class BaseMultiBlocPageState<T extends BaseMultiBlocPage, B extends BaseBloc, B1 extends BaseBloc> extends BaseMultiBlocWidgetState<T,B, B1>{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool subscribeToVisibilityEvents = false;

  BaseMultiBlocPageState({
    this.subscribeToVisibilityEvents =false
  });


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<B>(create: (context) => baseBloc),
        BlocProvider<B1>(create: (context) => secondBloc),
      ],
      child: buildPageScaffold(context),
    );
  }

  Widget buildPageScaffold(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        backgroundColor: scaffoldBackgroundColor(),
        key: _scaffoldKey,
        appBar: buildAppbar(),
        bottomNavigationBar: bottomNavigationBar(),
        floatingActionButton: floatingActionButton(),
        body: SafeArea(child: buildView(context)),
      ),
    );
  }

  Future<bool> onBackPressed({dynamic param}){
    return _onWillPop();
  }

  Future<bool> _onWillPop({dynamic param}){
    if(Navigator.canPop(context)){
      if(param != null){
        Navigator.pop(context,param);
            return Future.value(false);

      }else{
        Navigator.pop(context);
        return Future.value(false);
      }
    }
    return Future.value(true);
  }

  Color scaffoldBackgroundColor() {
    return Theme.of(context).scaffoldBackgroundColor;
  }

  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  Widget? bottomNavigationBar() {
    return null;
  }

  Widget? floatingActionButton() {
    return null;
  }

  FloatingActionButtonLocation? floatingActionButtonLocation() {
    return null;
  }

  bool extendBodyBehindAppBar() {
    return false;
  }

  bool getResizeToAvoidBottomInset() {
    return true;
  }

  bool extendBody() {
    return false;
  }

  Widget buildView(BuildContext context);
}