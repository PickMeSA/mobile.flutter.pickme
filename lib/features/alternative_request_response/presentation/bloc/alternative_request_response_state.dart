part of 'alternative_request_response_bloc.dart';
@immutable
abstract class AlternativeRequestResponsePageState extends BaseState {
  String? error;

  AlternativeRequestResponsePageState({this.error});
}

class AlternativeRequestResponsePageInitState extends AlternativeRequestResponsePageState  {}

class RescheduleBookingState extends AlternativeRequestResponsePageState{
  BookingEntity? bookingEntity;

  RescheduleBookingState({ super.error,this.bookingEntity});
}