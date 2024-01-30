part of 'alternative_request_details_bloc.dart';
 @immutable
abstract class AlternativeRequestDetailsPageEvent extends BaseEvent {}

class RescheduleBookingEvent extends AlternativeRequestDetailsPageEvent{
 RescheduleEntity rescheduleEntity;

 RescheduleBookingEvent({required this.rescheduleEntity});
}

