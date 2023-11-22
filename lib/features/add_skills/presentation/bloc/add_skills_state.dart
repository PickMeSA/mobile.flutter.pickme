part of 'add_skills_bloc.dart';
@immutable
abstract class AddSkillsPageState extends BaseState {
  bool checked;

  AddSkillsPageState({required this.checked});
}

class AddSkillsPageInitState extends AddSkillsPageState  {
  AddSkillsPageInitState({required super.checked});
}

