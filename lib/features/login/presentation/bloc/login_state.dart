part of 'login_bloc.dart';

@immutable
abstract class LoginState extends BaseState {
  bool checked;

  LoginState({required this.checked});
}

class LoginInitial extends LoginState {

  LoginInitial({required super.checked});
}

class LoginContinueClickedState extends LoginState{
  late bool? loggedIn;

  LoginContinueClickedState({this.loggedIn, required super.checked});
}

class NumberChangedState extends LoginState{

  NumberChangedState({required super.checked});
}
