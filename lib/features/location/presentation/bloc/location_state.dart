part of 'location_bloc.dart';
@immutable
abstract class LocationPageState extends BaseState {
  String? error;

  LocationPageState({this.error});
}

class LocationPageInitState extends LocationPageState  {}

class GetLocalCurrentLocationState extends LocationPageState{
  OTPLocationEntity? otpLocationEntity;

  GetLocalCurrentLocationState({this.otpLocationEntity, super.error});
}

