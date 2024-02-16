part of 'profile_bloc.dart';
 @immutable
abstract class ProfilePageEvent extends BaseEvent {}

class GetProfileDetailsEvent extends ProfilePageEvent{}

class UpdateUIEvent extends ProfilePageEvent{

  UpdateUIEvent();
}

class DeleteProfileEvent extends ProfilePageEvent{

}

class ProfilePictureAddedEvent extends ProfilePageEvent{
  final String filePath;
  ProfilePictureAddedEvent({required this.filePath});
}

class SubmitClickedEvent extends ProfilePageEvent{
  final String description;
  SubmitClickedEvent({required this.description});
}