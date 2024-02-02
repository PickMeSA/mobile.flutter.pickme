part of 'my_bookings_upcoming_bloc.dart';
@immutable
abstract class MyBookingsUpcomingPageState extends BaseState {
  String? error;

  MyBookingsUpcomingPageState({this.error});
}

class MyBookingsUpcomingPageInitState extends MyBookingsUpcomingPageState  {}

class CalendarMonthIncrementState extends MyBookingsUpcomingPageState{}

class CalendarMonthDecrementState extends MyBookingsUpcomingPageState{}

class CalendarDateSelectedState extends MyBookingsUpcomingPageState{}

class CalendarChangedState extends MyBookingsUpcomingPageState{}

class LoadBookingUpcomingState extends MyBookingsUpcomingPageState{

  LoadBookingUpcomingState({super.error});
}

