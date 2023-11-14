part of 'otp_bloc.dart';
 @immutable
abstract class otpPageEvent extends BaseEvent {}

class OTPGetTokenEvent extends otpPageEvent{
  String verificationId;
  String smsCode;

  OTPGetTokenEvent({required this.verificationId, required this.smsCode});
}

class RegisterOTPCompleteEvent extends otpPageEvent{
   UserModel? userModel;
   RegisterOTPCompleteEvent({this.userModel});
}


class LoginOTPCompleteEvent extends otpPageEvent{
   String? otp;

   LoginOTPCompleteEvent({this.otp});
}

