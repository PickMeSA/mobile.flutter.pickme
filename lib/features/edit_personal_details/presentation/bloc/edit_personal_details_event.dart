part of 'edit_personal_details_bloc.dart';
 @immutable
abstract class EditPersonalDetailsPageEvent extends BaseEvent {}

class WorkingDaySelectedEvent extends EditPersonalDetailsPageEvent {
 final WorkingDaysEntity workingDaysEntity;
 WorkingDaySelectedEvent({
  required this.workingDaysEntity
 });
}

class SkillChipDeletedEvent extends EditPersonalDetailsPageEvent{
 int? index;
 SkillChipDeletedEvent({this.index});
}

class UpdatePersonalDetailsEvent extends EditPersonalDetailsPageEvent{
  final ProfileEntity profileEntity;

  UpdatePersonalDetailsEvent({required this.profileEntity});
}