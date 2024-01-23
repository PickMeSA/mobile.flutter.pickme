part of 'edit_work_experience_bloc.dart';
@immutable
abstract class EditWorkExperiencePageState extends BaseState {
  String? error;

  EditWorkExperiencePageState({this.error});
}

class EditWorkExperiencePageInitState extends EditWorkExperiencePageState  {}

class EditWorkExperienceAddWorkState extends EditWorkExperiencePageState{

}

class SubmitWorkExperienceStatus extends EditWorkExperiencePageState{
  SubmitWorkExperienceStatus({super.error});
}