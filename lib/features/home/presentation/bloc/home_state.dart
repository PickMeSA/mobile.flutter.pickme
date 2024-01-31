part of 'home_bloc.dart';
@immutable
abstract class HomePageState extends BaseState {
  String? error;

  HomePageState({this.error});

}

class HomePageInitState extends HomePageState  {}

class CalendarMonthIncrementState extends HomePageState{}

class CalendarMonthDecrementState extends HomePageState{}

class CalendarDateSelectedState extends HomePageState{}

class CalendarChangedState extends HomePageState{}

class LoadJobsInAreaState extends HomePageState{

  LoadJobsInAreaState({super.error});
}

class JobsHiringLandingPageEnteredState extends HomePageState{

  JobsHiringLandingPageEnteredState({super.error});
}

class NextAppointmentCardClickedState extends HomePageState{
  String? bookingId;

  NextAppointmentCardClickedState({this.bookingId, super.error});
}

