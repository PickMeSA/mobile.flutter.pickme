part of 'otp_bloc.dart';
@immutable
abstract class otpPageState extends BaseState {
  String? error;
  UserEntity? userModel;
  otpPageState({this.error, this.userModel});
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
  SaveRemoteProfileDataState({super.error, super.userModel });
}

class GetProfileProgressState extends otpPageState{
  ProfileEntity? profileEntity;
  GetProfileProgressState({required super.userModel,this.profileEntity, super.error });
}

