part of 'add_skills_bloc.dart';
 @immutable
abstract class AddSkillsPageEvent extends BaseEvent {}

class SkillSelectedEvent extends AddSkillsPageEvent{
  final SkillEntity skill;

  SkillSelectedEvent({required this.skill});
}

class PreferredIndustrySelectedEvent extends AddSkillsPageEvent{

  final PreferredIndustryEntity preferredIndustry;

  PreferredIndustrySelectedEvent({required this.preferredIndustry});
}

class SkillChipDeletedEvent extends AddSkillsPageEvent{
  int index;
  SkillChipDeletedEvent({required this.index});
}

class AddSkillsGetPreferredIndustryListEvent extends AddSkillsPageEvent{

}

class AddSkillGetSkillsListEvent extends AddSkillsPageEvent{

}

class AddSkillSubmitRemoteSkillsAndIndustryEvent extends AddSkillsPageEvent{

}

