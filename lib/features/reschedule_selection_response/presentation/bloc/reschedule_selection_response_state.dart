part of 'reschedule_selection_response_bloc.dart';
@immutable
abstract class RescheduleSelectionResponsePageState extends BaseState {
  String? error;
  RescheduleSelectionResponsePageState({this.error});
}

class RescheduleSelectionResponsePageInitState extends RescheduleSelectionResponsePageState  {}

class RescheduleBookingState extends RescheduleSelectionResponsePageState{
  BookingEntity? bookingEntity;

  RescheduleBookingState({ super.error,this.bookingEntity});
}