part of 'otp_bloc.dart';
 @immutable
abstract class otpPageEvent extends BaseEvent {}

class OTPGetTokenEvent extends otpPageEvent{
  final int stage;

  OTPGetTokenEvent({required this.stage});
}

class RegisterOTPCompleteEvent extends otpPageEvent{
   UserEntity? userEntity;
   ProfileEntity? profileEntity;
   RegisterOTPCompleteEvent({this.userEntity, this.profileEntity});
}


class LoginOTPCompleteEvent extends otpPageEvent{
   String? otp;

   LoginOTPCompleteEvent({this.otp});
}

class OTPEnteredEvent extends otpPageEvent{

   String otp;

   OTPEnteredEvent({required this.otp});
}

class SaveRemoteProfileDataEvent extends otpPageEvent{
   final UserEntity userModel;

   SaveRemoteProfileDataEvent({required this.userModel});
}

class GetProfileProgressEvent extends otpPageEvent{
   UserEntity? userModel;

   GetProfileProgressEvent({this.userModel});
}

