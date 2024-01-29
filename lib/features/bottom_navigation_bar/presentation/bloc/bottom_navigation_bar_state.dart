part of 'bottom_navigation_bar_bloc.dart';
@immutable
abstract class BottomNavigationBarPageState extends BaseState {
  String? error;

  BottomNavigationBarPageState({this.error});
}

class BottomNavigationBarPageInitState extends BottomNavigationBarPageState  {}

class GetProfileDetailsState extends BottomNavigationBarPageState{
  ProfileEntity? profileEntity;
  GetProfileDetailsState({this.profileEntity,super.error});
}