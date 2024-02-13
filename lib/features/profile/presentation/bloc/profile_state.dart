part of 'profile_bloc.dart';
@immutable
abstract class ProfilePageState extends BaseState {
  String? error;

  ProfilePageState({this.error});
}

class ProfilePageInitState extends ProfilePageState  {}

class GetProfileDetailsState extends ProfilePageState{
  GetProfileDetailsState({super.error});
}

class UpdateUIState extends ProfilePageState{}

class DeleteProfileState extends ProfilePageState{
  DeleteProfileState({super.error});

}

class ProfilePictureAddedState extends ProfilePageState  {

  ProfilePictureAddedState({super.error});
}

class SubmitClickedState extends ProfilePageState  {
  final ProfileEntity? profileEntity;

  SubmitClickedState({ this.profileEntity, super.error});
}
