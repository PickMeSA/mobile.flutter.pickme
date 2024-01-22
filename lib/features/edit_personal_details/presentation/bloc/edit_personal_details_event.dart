part of 'edit_personal_details_bloc.dart';
 @immutable
abstract class EditPersonalDetailsPageEvent extends BaseEvent {}

class WorkingDaySelectedEvent extends EditPersonalDetailsPageEvent {
 final WorkingDaysEntity workingDaysEntity;
 final ProfileEntity? profileEntity;
 WorkingDaySelectedEvent({
  required this.workingDaysEntity,
   required this.profileEntity
 });
}

class SkillChipDeletedEvent extends EditPersonalDetailsPageEvent{
   ProfileEntity? profileEntity;
 int? index;
 SkillChipDeletedEvent({this.profileEntity,this.index});
}

class UpdatePersonalDetailsEvent extends EditPersonalDetailsPageEvent{
  final ProfileEntity profileEntity;

  UpdatePersonalDetailsEvent({required this.profileEntity});
}

