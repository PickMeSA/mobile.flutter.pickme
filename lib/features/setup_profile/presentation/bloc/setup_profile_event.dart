part of 'setup_profile_bloc.dart';
 @immutable
abstract class SetupProfilePageEvent extends BaseEvent {}

class SetUpProfileGetProfileEvent extends SetupProfilePageEvent{}

class SetUpProfileToggleSelectedEvent extends SetupProfilePageEvent{
  int selectedIndex;

  SetUpProfileToggleSelectedEvent({required this.selectedIndex});
}

class SetupProfileSubmitProfileTypeEvent extends SetupProfilePageEvent{}
