part of 'login_bloc.dart';

@immutable
abstract class LoginState extends BaseState {}

class LoginInitial extends LoginState {}

class LoginContinueClickedState extends LoginState{
  late bool? loggedIn;

  LoginContinueClickedState({this.loggedIn});
}
