part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends BaseEvent {}

class SelectLoginEvent extends LoginEvent{
  final String userName;
  final String passWord;

  SelectLoginEvent({required this.passWord, required this.userName});
}
