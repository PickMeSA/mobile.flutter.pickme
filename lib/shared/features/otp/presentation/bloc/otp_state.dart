part of 'otp_bloc.dart';
@immutable
abstract class otpPageState extends BaseState {

}

class otpPageInitState extends otpPageState  {


}

class OTPGetTokenState extends otpPageState{
  TokenModel ?tokenModel;

  OTPGetTokenState({this.tokenModel});
}

class RegisterOTPCompleteState extends otpPageState{
}

class LoginOTPCompleteState extends otpPageState{
}

class OTPEnteredState extends otpPageState{
}

