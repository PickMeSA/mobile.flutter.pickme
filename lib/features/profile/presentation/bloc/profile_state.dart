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