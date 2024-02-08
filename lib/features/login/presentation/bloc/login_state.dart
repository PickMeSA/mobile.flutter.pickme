part of 'login_bloc.dart';

@immutable
abstract class LoginState extends BaseState {
  bool?checked;
  String? error;

  LoginState({ this.checked, this.error});
}

class LoginInitial extends LoginState {

  LoginInitial({required super.checked});
}

class LoginContinueClickedState extends LoginState{
  late bool? loggedIn;
  final ProfileEntity? profileEntity;

  LoginContinueClickedState({
    this.profileEntity,
    this.loggedIn,
    super.checked,
    super.error});
}

class NumberChangedState extends LoginState{

  NumberChangedState();
}
