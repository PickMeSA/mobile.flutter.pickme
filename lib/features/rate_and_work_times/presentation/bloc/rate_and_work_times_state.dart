part of 'rate_and_work_times_bloc.dart';
@immutable
abstract class RateAndWorkTimesPageState extends BaseState {
  String? error;

  RateAndWorkTimesPageState({this.error});
}

class RateAndWorkTimesPageInitState extends RateAndWorkTimesPageState  {}

class FormValueChangedState extends RateAndWorkTimesPageState{}

class WorkingDaySelectedState extends RateAndWorkTimesPageState{
}

class SkillChipDeletedState extends RateAndWorkTimesPageState{

}

class SubmitRemoteRateAndWorkTimesState extends RateAndWorkTimesPageState{

   ProfileEntity? profileEntity;

  SubmitRemoteRateAndWorkTimesState({ this.profileEntity});


}

