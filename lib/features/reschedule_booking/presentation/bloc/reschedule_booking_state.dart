part of 'reschedule_booking_bloc.dart';
@immutable
abstract class RescheduleBookingPageState extends BaseState {
  String? error;

  RescheduleBookingPageState({this.error});
}

class RescheduleBookingPageInitState extends RescheduleBookingPageState  {}

class RescheduleBookingClickedState extends RescheduleBookingPageState{
  RescheduleBookingClickedState({super.error});
}

