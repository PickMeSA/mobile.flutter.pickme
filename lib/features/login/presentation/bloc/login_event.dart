part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends BaseEvent{
}

class LoginContinueClickedEvent extends LoginEvent{
  final String mobileNumber;
  final String countryCode;

  LoginContinueClickedEvent({
    required this.mobileNumber,
  required this.countryCode});
}

class NumberChangedEvent extends LoginEvent{
  String mobileNumber;

  NumberChangedEvent({required this.mobileNumber});
}

