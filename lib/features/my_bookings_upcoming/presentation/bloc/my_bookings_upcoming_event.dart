part of 'my_bookings_upcoming_bloc.dart';
 @immutable
abstract class MyBookingsUpcomingPageEvent extends BaseEvent {}

class CalendarMonthIncrementEvent extends MyBookingsUpcomingPageEvent{}


class CalendarMonthDecrementEvent extends MyBookingsUpcomingPageEvent{}

class CalendarDateSelectedEvent extends MyBookingsUpcomingPageEvent{
  final DateTime dateTime;
  final List<Event> events;

  CalendarDateSelectedEvent({required this.dateTime, required this.events});

}

class CalendarChangedEvent extends MyBookingsUpcomingPageEvent{
  final DateTime dateTime;

  CalendarChangedEvent({required this.dateTime});
}

class GetUpcomingBookingsEvent extends MyBookingsUpcomingPageEvent{

}