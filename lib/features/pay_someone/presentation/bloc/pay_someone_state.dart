part of 'pay_someone_bloc.dart';
@immutable
abstract class PaySomeonePageState extends BaseState {

  String? error;

  PaySomeonePageState({this.error});
}

class PaySomeonePageInitState extends PaySomeonePageState  {}

class LoadBookingUpcomingState extends PaySomeonePageState{
  LoadBookingUpcomingState({super.error});
}