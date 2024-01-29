part of 'reschedule_selection_response_bloc.dart';
 @immutable
abstract class RescheduleSelectionResponsePageEvent extends BaseEvent {}

class RescheduleBookingEvent extends RescheduleSelectionResponsePageEvent{
 RescheduleEntity rescheduleEntity;

 RescheduleBookingEvent({required this.rescheduleEntity});
}
