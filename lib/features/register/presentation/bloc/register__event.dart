part of 'register__bloc.dart';

@immutable
abstract class RegisterEvent extends BaseEvent {
}

class ContinueClickedEvent extends RegisterEvent{
 final UserModel user;

 ContinueClickedEvent({required this.user});
}

class PassportClickedEvent extends RegisterEvent{}

class IdClickedEvent extends RegisterEvent{}