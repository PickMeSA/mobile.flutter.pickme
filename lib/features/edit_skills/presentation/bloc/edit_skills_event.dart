part of 'edit_skills_bloc.dart';
 @immutable
abstract class EditSkillsPageEvent extends BaseEvent {}

class SkillSelectedEvent extends EditSkillsPageEvent{
 final SkillEntity skill;

 SkillSelectedEvent({required this.skill});
}
class SkillChipDeletedEvent extends EditSkillsPageEvent{
 int index;
 SkillChipDeletedEvent({required this.index});
}

class EditSkillsGetSkillsListEvent extends EditSkillsPageEvent{

  ProfileEntity? profileEntity;

  EditSkillsGetSkillsListEvent({required this.profileEntity});
}

class SubmitRemoteSkillsListEvent extends EditSkillsPageEvent{

   ProfileEntity? profileEntity;

   SubmitRemoteSkillsListEvent({required this.profileEntity});
}