part of 'add_work_experience_bloc.dart';
 @immutable
abstract class AddWorkExperiencePageEvent extends BaseEvent {}

class AddWorkExperienceCurrentSelectedEvent extends AddWorkExperiencePageEvent{
}

class AddWorkExperienceGetPreferredIndustryListEvent extends AddWorkExperiencePageEvent{

}

class PreferredIndustrySelectedEvent extends AddWorkExperiencePageEvent{

 final PreferredIndustryEntity preferredIndustry;

 PreferredIndustrySelectedEvent({required this.preferredIndustry});
}
