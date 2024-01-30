part of 'cancel_booking_bloc.dart';
 @immutable
abstract class CancelBookingPageEvent extends BaseEvent {}

class CancelBookingClickedEvent extends CancelBookingPageEvent{
  final RescheduleEntity rescheduleEntity;

  CancelBookingClickedEvent({required this.rescheduleEntity});
}
