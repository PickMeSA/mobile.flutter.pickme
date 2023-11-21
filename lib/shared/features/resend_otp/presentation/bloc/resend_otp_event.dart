part of 'resend_otp_bloc.dart';
 @immutable
abstract class ResendOTPPageEvent extends BaseEvent {}

class NumberEnteredEvent extends ResendOTPPageEvent{
  final String mobileNumber;

  NumberEnteredEvent({required this.mobileNumber});
}

class ResendOTPSubmitClickedEvent extends ResendOTPPageEvent{
   final UserModel userModel;

   ResendOTPSubmitClickedEvent({required this.userModel});
}
