part of 'otp_bloc.dart';
 @immutable
abstract class otpPageEvent extends BaseEvent {}

class OTPGetTokenEvent extends otpPageEvent{
  String verificationId;
  String smsCode;

  OTPGetTokenEvent({required this.verificationId, required this.smsCode});
}
