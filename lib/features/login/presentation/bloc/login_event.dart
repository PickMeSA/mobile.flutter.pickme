part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends BaseEvent{
}

class LoginContinueClickedEvent extends LoginEvent{

  final String email;
  LoginContinueClickedEvent(this.email);
}

class NumberChangedEvent extends LoginEvent{
  String email;
  String password;

  NumberChangedEvent({
    required this.email,
  required this.password});
}

