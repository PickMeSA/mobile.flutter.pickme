part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends BaseEvent{}

class LoginContinueClickedEvent extends LoginEvent{
  final String mobileNumber;

  LoginContinueClickedEvent({required this.mobileNumber});


}

