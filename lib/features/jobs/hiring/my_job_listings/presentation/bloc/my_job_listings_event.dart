part of 'my_job_listings_bloc.dart';

@immutable
abstract class MyJobListingsEvent extends BaseEvent {}

class SeeAllClickedEvent extends MyJobListingsEvent{
  SeeAllClickedEvent();
}
class MyJobListingsPageEnteredEvent extends MyJobListingsEvent{
  final MyJobListingsPageEntity? jobListingsPageEntity;
  MyJobListingsPageEnteredEvent({this.jobListingsPageEntity});
}

class SelectedTabChangedEvent extends MyJobListingsEvent{
  final int tabIndex;
  SelectedTabChangedEvent({required this.tabIndex});
}


