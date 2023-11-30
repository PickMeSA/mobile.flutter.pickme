part of 'otp_bloc.dart';
 @immutable
abstract class otpPageEvent extends BaseEvent {}

class OTPGetTokenEvent extends otpPageEvent{
  String verificationId;
  String smsCode;

  OTPGetTokenEvent({required this.verificationId, required this.smsCode});
}

class RegisterOTPCompleteEvent extends otpPageEvent{
   UserEntity? userModel;
   RegisterOTPCompleteEvent({this.userModel});
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

