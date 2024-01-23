part of 'cancel_booking_bloc.dart';
@immutable
abstract class CancelBookingPageState extends BaseState {
   String? error;
   CancelBookingPageState({ this.error});
}

class CancelBookingPageInitState extends CancelBookingPageState  {}

class CancelBookingClickedState extends CancelBookingPageState{
  CancelBookingClickedState({super.error});
}