part of 'edit_work_experience_details_bloc.dart';
 @immutable
abstract class EditWorkExperienceDetailsPageEvent extends BaseEvent {}

class AddWorkExperienceCurrentSelectedEvent extends EditWorkExperienceDetailsPageEvent{
}

class AddWorkExperienceGetPreferredIndustryListEvent extends EditWorkExperienceDetailsPageEvent{

}
class PreferredIndustrySelectedEvent extends EditWorkExperienceDetailsPageEvent{

 final PreferredIndustryEntity preferredIndustry;

 PreferredIndustrySelectedEvent({required this.preferredIndustry});
}