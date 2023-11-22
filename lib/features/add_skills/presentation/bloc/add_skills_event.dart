part of 'add_skills_bloc.dart';
 @immutable
abstract class AddSkillsPageEvent extends BaseEvent {}

class SkillSelectedEvent extends AddSkillsPageEvent{
  final Skill skill;

  SkillSelectedEvent({required this.skill});
}

class PreferredIndustrySelectedEvent extends AddSkillsPageEvent{

  final PreferredIndustry preferredIndustry;

  PreferredIndustrySelectedEvent({required this.preferredIndustry});
}

class SkillChipDeletedEvent extends AddSkillsPageEvent{
  int index;

  SkillChipDeletedEvent({required this.index});
}

