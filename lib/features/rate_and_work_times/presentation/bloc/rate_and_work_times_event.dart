part of 'rate_and_work_times_bloc.dart';
 @immutable
abstract class RateAndWorkTimesPageEvent extends BaseEvent {}

class FormValueChangedEvent extends RateAndWorkTimesPageEvent {
  final RatesAndWorkTimesEntity hourRateTimes;

  FormValueChangedEvent({
  required this.hourRateTimes});
}

class WorkingDaySelectedEvent extends RateAndWorkTimesPageEvent{
   final WorkingDaysEntity workingDaysEntity;

   WorkingDaySelectedEvent({
     required this.workingDaysEntity
});

}

class SkillChipDeletedEvent extends RateAndWorkTimesPageEvent{
   int? index;

   SkillChipDeletedEvent({this.index});
}

class SubmitRemoteRateAndWorkTimesEvent extends RateAndWorkTimesPageEvent{
   final RatesAndWorkTimesEntity ratesAndWorkTimesEntity;

   SubmitRemoteRateAndWorkTimesEvent({required this.ratesAndWorkTimesEntity});
}