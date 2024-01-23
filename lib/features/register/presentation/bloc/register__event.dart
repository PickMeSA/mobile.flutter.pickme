part of 'register__bloc.dart';

@immutable
abstract class RegisterEvent extends BaseEvent {
}

class SubmitClickedEvent extends RegisterEvent{
 final UserEntity user;

 SubmitClickedEvent({required this.user});
}

class PassportClickedEvent extends RegisterEvent{}

class IdClickedEvent extends RegisterEvent{}

class ValueChangedEvent extends RegisterEvent{
UserEntity userModel;

 ValueChangedEvent({
 required this.userModel
});


}

class IdentificationChangedEvent extends RegisterEvent{
  int index;

  IdentificationChangedEvent({required this.index});

}