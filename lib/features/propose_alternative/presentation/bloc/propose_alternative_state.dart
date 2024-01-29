part of 'propose_alternative_bloc.dart';
@immutable
abstract class ProposeAlternativePageState extends BaseState {
  String? error;

  ProposeAlternativePageState({this.error});
}

class ProposeAlternativePageInitState extends ProposeAlternativePageState  {}

class ProposeAlternativeClickedState extends ProposeAlternativePageState{

}

class RescheduleBookingState extends ProposeAlternativePageState{
  BookingEntity? bookingEntity;

  RescheduleBookingState({ super.error,this.bookingEntity});
}