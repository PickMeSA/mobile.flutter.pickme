part of 'alternative_request_response_bloc.dart';
 @immutable
abstract class AlternativeRequestResponsePageEvent extends BaseEvent {}


class RescheduleBookingEvent extends AlternativeRequestResponsePageEvent{
 RescheduleEntity rescheduleEntity;

 RescheduleBookingEvent({required this.rescheduleEntity});
}