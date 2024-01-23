part of 'reschedule_booking_bloc.dart';
 @immutable
abstract class RescheduleBookingPageEvent extends BaseEvent {}

class RescheduleBookingClickedEvent extends RescheduleBookingPageEvent{
  final RescheduleEntity rescheduleEntity;

  RescheduleBookingClickedEvent({ required this.rescheduleEntity});
}
