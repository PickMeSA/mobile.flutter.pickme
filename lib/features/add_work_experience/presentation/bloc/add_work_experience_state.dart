part of 'add_work_experience_bloc.dart';
@immutable
abstract class AddWorkExperiencePageState extends BaseState {
  String? error;

  AddWorkExperiencePageState({ this.error});
}

class AddWorkExperiencePageInitState extends AddWorkExperiencePageState  {}

class AddWorkExperienceCurrentSelectedState extends AddWorkExperiencePageState{

}

class AddWorkGetPreferredIndustryListState extends AddWorkExperiencePageState{
  AddWorkGetPreferredIndustryListState({super.error});
}