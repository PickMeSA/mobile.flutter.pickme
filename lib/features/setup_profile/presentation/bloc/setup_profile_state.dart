part of 'setup_profile_bloc.dart';
@immutable
abstract class SetupProfilePageState extends BaseState {
  ProfileModel? profileModel;

  SetupProfilePageState({this.profileModel});


}

class SetupProfilePageInitState extends SetupProfilePageState  {
  SetupProfilePageInitState({super.profileModel});
}

class SetUpProfileGetProfileState extends SetupProfilePageState{


  SetUpProfileGetProfileState({super.profileModel});
}

