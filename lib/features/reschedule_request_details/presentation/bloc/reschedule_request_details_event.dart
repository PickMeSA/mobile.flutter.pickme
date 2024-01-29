part of 'reschedule_request_details_bloc.dart';
 @immutable
abstract class RescheduleRequestDetailsPageEvent extends BaseEvent {}

class RescheduleBookingEvent extends RescheduleRequestDetailsPageEvent{
  RescheduleEntity rescheduleEntity;

  RescheduleBookingEvent({required this.rescheduleEntity});
}
