part of 'register__bloc.dart';

@immutable
abstract class RegisterState extends BaseState {}

class RegisterInitial extends RegisterState {}

class ContinueClickedState extends RegisterState{
  UserModel? userModel;
  String? verificationId;
  int? resendToken;
  ContinueClickedState({this.userModel, this.verificationId, this.resendToken});
}

class PassportClickedState extends RegisterState{}

class IDClickedState extends RegisterState{}

class ValueChangedState extends RegisterState{}

class IdentificationChangedState extends RegisterState{

}
