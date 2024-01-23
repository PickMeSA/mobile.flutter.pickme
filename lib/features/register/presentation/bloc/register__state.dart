part of 'register__bloc.dart';

@immutable
abstract class RegisterState extends BaseState {
  String? error;

  RegisterState({this.error});
}

class RegisterInitial extends RegisterState {}

class ContinueClickedState extends RegisterState{
  UserEntity? userModel;
  String? verificationId;
  int? resendToken;
  ContinueClickedState({super.error,this.userModel, this.verificationId, this.resendToken});
}

class PassportClickedState extends RegisterState{}

class IDClickedState extends RegisterState{}

class ValueChangedState extends RegisterState{}

class IdentificationChangedState extends RegisterState{

}
