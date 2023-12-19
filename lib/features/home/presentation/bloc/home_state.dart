part of 'home_bloc.dart';
@immutable
abstract class HomePageState extends BaseState {}

class HomePageInitState extends HomePageState  {}

class CalendarMonthIncrementState extends HomePageState{}

class CalendarMonthDecrementState extends HomePageState{}

class CalendarDateSelectedState extends HomePageState{}

class CalendarChangedState extends HomePageState{}

