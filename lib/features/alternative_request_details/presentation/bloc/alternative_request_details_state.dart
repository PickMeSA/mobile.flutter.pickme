part of 'alternative_request_details_bloc.dart';
@immutable
abstract class AlternativeRequestDetailsPageState extends BaseState {
  String? error;

  AlternativeRequestDetailsPageState({this.error});
}

class AlternativeRequestDetailsPageInitState extends AlternativeRequestDetailsPageState  {}

class RescheduleBookingState extends AlternativeRequestDetailsPageState{
  BookingEntity? bookingEntity;

  RescheduleBookingState({ super.error,this.bookingEntity});
}