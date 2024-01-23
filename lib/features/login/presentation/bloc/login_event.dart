part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends BaseEvent{
}

class LoginContinueClickedEvent extends LoginEvent{
  final int state;

  LoginContinueClickedEvent({
    required this.state});
}

class NumberChangedEvent extends LoginEvent{
  String mobileNumber;

  NumberChangedEvent({required this.mobileNumber});
}

