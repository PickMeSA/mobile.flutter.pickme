part of 'add_skills_bloc.dart';
@immutable
abstract class AddSkillsPageState extends BaseState {
  String? error;

  AddSkillsPageState({this.error});
}

class AddSkillsPageInitState extends AddSkillsPageState  {
  AddSkillsPageInitState();
}

class SkillSelectedState extends AddSkillsPageState{
  SkillSelectedState();
}

class SkillChipDeletedState extends AddSkillsPageState{

}

class AddSkillsGetPreferredIndustryListState extends AddSkillsPageState{

  AddSkillsGetPreferredIndustryListState({super.error});
}

class AddSkillGetSkillsListState extends AddSkillsPageState{
  AddSkillGetSkillsListState({super.error});
}

class AddSkillSubmitRemoteSkillsAndIndustryState extends AddSkillsPageState{
  final ProfileEntity? profileEntity;
  AddSkillSubmitRemoteSkillsAndIndustryState({super.error, this.profileEntity});
}