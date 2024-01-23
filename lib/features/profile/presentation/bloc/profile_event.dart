part of 'profile_bloc.dart';
 @immutable
abstract class ProfilePageEvent extends BaseEvent {}

class GetProfileDetailsEvent extends ProfilePageEvent{}

class UpdateUIEvent extends ProfilePageEvent{

  UpdateUIEvent();
}