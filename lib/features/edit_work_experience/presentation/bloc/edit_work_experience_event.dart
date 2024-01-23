part of 'edit_work_experience_bloc.dart';
 @immutable
abstract class EditWorkExperiencePageEvent extends BaseEvent {}

class EditWorkExperienceAddWorkEvent extends EditWorkExperiencePageEvent{
}

class SubmitWorkExperienceEvent extends EditWorkExperiencePageEvent{

  final ProfileEntity profileEntity;

  SubmitWorkExperienceEvent({required this.profileEntity});
}
