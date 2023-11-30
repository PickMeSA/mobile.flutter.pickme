part of 'rate_and_work_times_bloc.dart';
 @immutable
abstract class RateAndWorkTimesPageEvent extends BaseEvent {}

class FormValueChangedEvent extends RateAndWorkTimesPageEvent {
  HourRateTimes hourRateTimes;

  FormValueChangedEvent({
  required this.hourRateTimes});
}