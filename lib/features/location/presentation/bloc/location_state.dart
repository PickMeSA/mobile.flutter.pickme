part of 'location_bloc.dart';
@immutable
abstract class LocationPageState extends BaseState {
  String? error;

  LocationPageState({this.error});
}

class LocationPageInitState extends LocationPageState  {}

class LocationSelectedState extends LocationPageState{}

class LocationRemoteSubmitLocationState extends LocationPageState{
  final ProfileEntity? profileEntity;

  LocationRemoteSubmitLocationState({ this.profileEntity, super.error});
}

