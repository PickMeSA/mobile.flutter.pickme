part of 'otp_bloc.dart';
@immutable
abstract class otpPageState extends BaseState {
  String? error;

  otpPageState({this.error});
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

class SaveRemoteProfileDataState extends otpPageState{
  SaveRemoteProfileDataState({super.error});
}

class GetProfileProgressState extends otpPageState{}

