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

class ProfilePictureAddedEvent extends AddWorkExperiencePageEvent{
 final String filePath;

 ProfilePictureAddedEvent({required this.filePath});
}

class RemoveImageClickedEvent extends AddWorkExperiencePageEvent{
 final int? index;

 RemoveImageClickedEvent({required this.index});
}

