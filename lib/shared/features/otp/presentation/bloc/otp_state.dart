part of 'otp_bloc.dart';
@immutable
abstract class otpPageState extends BaseState {}

class otpPageInitState extends otpPageState  {}

class OTPGetCredentialsState extends otpPageState{
  UserCredential ?userCredential;

  OTPGetCredentialsState({this.userCredential});
}

