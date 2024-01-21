part of 'edit_work_experience_details_bloc.dart';
@immutable
abstract class EditWorkExperienceDetailsPageState extends BaseState {
  String? error;

  EditWorkExperienceDetailsPageState({this.error});
}

class EditWorkExperienceDetailsPageInitState extends EditWorkExperienceDetailsPageState  {}

class AddWorkExperiencePageInitState extends EditWorkExperienceDetailsPageState  {}

class AddWorkExperienceCurrentSelectedState extends EditWorkExperienceDetailsPageState{

}

class AddWorkGetPreferredIndustryListState extends EditWorkExperienceDetailsPageState{
  AddWorkGetPreferredIndustryListState({super.error});
}

