part of 'edit_personal_details_bloc.dart';
@immutable
abstract class EditPersonalDetailsPageState extends BaseState {
  String? error;

  EditPersonalDetailsPageState({this.error});
}

class EditPersonalDetailsPageInitState extends EditPersonalDetailsPageState  {}

class UpdatePersonalDetailsState extends EditPersonalDetailsPageState{
  ProfileEntity? profileEntity;

  UpdatePersonalDetailsState({this.profileEntity, super.error});
}