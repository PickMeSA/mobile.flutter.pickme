part of 'register__bloc.dart';

@immutable
abstract class RegisterEvent extends BaseEvent {
}

class ContinueClickedEvent extends RegisterEvent{
 final User user;

 ContinueClickedEvent({required this.user});
}
