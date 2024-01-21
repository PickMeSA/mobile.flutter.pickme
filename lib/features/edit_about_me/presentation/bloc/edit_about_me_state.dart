part of 'edit_about_me_bloc.dart';
@immutable
abstract class EditAboutMePageState extends BaseState {
  String? error;

  EditAboutMePageState({ this.error});
}

class EditAboutMePageInitState extends EditAboutMePageState  {}

class SubmitClickedState extends EditAboutMePageState  {
  ProfileEntity? profileEntity;
  SubmitClickedState({this.profileEntity,super.error});
}