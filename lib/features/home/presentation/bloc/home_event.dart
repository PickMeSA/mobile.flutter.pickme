part of 'home_bloc.dart';
 @immutable
abstract class HomePageEvent extends BaseEvent {}

class CalendarMonthIncrementEvent extends HomePageEvent{}


class CalendarMonthDecrementEvent extends HomePageEvent{}

class CalendarDateSelectedEvent extends HomePageEvent{
 final DateTime dateTime;
 final List<Event> events;

 CalendarDateSelectedEvent({required this.dateTime, required this.events});

}

class CalendarChangedEvent extends HomePageEvent{
 final DateTime dateTime;

 CalendarChangedEvent({required this.dateTime});
}

class LoadJobsInAreaEvent extends HomePageEvent{


 LoadJobsInAreaEvent();
}

class JobsHiringLandingPageEnteredEvent extends HomePageEvent{
 JobsHiringLandingPageEnteredEvent();
}

class NextAppointmentCardClickedEvent extends HomePageEvent{

}
