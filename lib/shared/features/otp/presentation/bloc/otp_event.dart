part of 'otp_bloc.dart';
 @immutable
abstract class otpPageEvent extends BaseEvent {}

class OTPGetCredentialsEvent extends otpPageEvent{
  String verificationId;
  String smsCode;

  OTPGetCredentialsEvent({required this.verificationId, required this.smsCode});
}
