part of 'reschedule_request_details_bloc.dart';
@immutable
abstract class RescheduleRequestDetailsPageState extends BaseState {
  String? error;

  RescheduleRequestDetailsPageState({this.error});
}

class RescheduleRequestDetailsPageInitState extends RescheduleRequestDetailsPageState  {}

class RescheduleBookingState extends RescheduleRequestDetailsPageState{
  BookingEntity? bookingEntity;

  RescheduleBookingState({ super.error,this.bookingEntity});
}