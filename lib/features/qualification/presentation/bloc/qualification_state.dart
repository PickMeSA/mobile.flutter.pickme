part of 'qualification_bloc.dart';
@immutable
abstract class QualificationsPageState extends BaseState {
  String? error;

  QualificationsPageState({this.error});
}

class QualificationsPageInitState extends QualificationsPageState  {

  QualificationsPageInitState();
}

class AddQualificationState extends QualificationsPageState{
  AddQualificationState();
}

class AddWorkExperienceState extends QualificationsPageState{

}

class AddQualificationRemoteSubmitState extends QualificationsPageState{
 ProfileEntity? profileEntity;

 AddQualificationRemoteSubmitState({ this.profileEntity,  super.error});
}

