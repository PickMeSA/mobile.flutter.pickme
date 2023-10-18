part of 'login_bloc.dart';

@immutable
abstract class LoginState extends BaseState {}

class LoginInitial extends LoginState {}

class SelectLoginState extends LoginState{
  final String approvalMessage;

  SelectLoginState({required this.approvalMessage});
}
