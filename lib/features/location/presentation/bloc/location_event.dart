part of 'location_bloc.dart';
 @immutable
abstract class LocationPageEvent extends BaseEvent {}

class GetLocalCurrentLocationEvent extends LocationPageEvent{
}

class LocationSelectedEvent extends LocationPageEvent{
  final OTPLocationEntity otpLocationEntity;

  LocationSelectedEvent({required this.otpLocationEntity});
}

class LocationRemoteSubmitLocationEvent extends LocationPageEvent{


   LocationRemoteSubmitLocationEvent();
}
