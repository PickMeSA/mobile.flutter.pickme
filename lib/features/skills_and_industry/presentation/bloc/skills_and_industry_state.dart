part of 'skills_and_industry_bloc.dart';
@immutable
abstract class SkillsAndIndustryPageState extends BaseState {
  List<DropdownMenuEntry<String>>? entries;
  SkillsAndIndustryPageState({this.entries});
}

class SkillsAndIndustryPageInitState extends SkillsAndIndustryPageState  {

  SkillsAndIndustryPageInitState({super.entries});
}

