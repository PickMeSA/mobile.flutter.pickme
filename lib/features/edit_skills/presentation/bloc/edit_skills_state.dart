part of 'edit_skills_bloc.dart';
@immutable
abstract class EditSkillsPageState extends BaseState {
  String? error;


  EditSkillsPageState({this.error});
}

class EditSkillsPageInitState extends EditSkillsPageState  {}

class SkillSelectedState extends EditSkillsPageEvent{
  final SkillEntity skill;

  SkillSelectedState({required this.skill});
}
class SkillChipDeletedState extends EditSkillsPageState{

  SkillChipDeletedState();
}

class EditSkillsGetSkillsListState extends EditSkillsPageState{

  ProfileEntity? profileEntity;

  EditSkillsGetSkillsListState({ this.profileEntity, super.error});
}

class EditSkillSelectedState extends EditSkillsPageState{
  EditSkillSelectedState();
}


class SubmitRemoteSkillsListState extends EditSkillsPageState{
  ProfileEntity? profileEntity;
  SubmitRemoteSkillsListState({super.error, this.profileEntity});
}