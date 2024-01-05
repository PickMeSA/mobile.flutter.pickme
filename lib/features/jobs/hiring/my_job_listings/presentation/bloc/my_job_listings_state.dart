part of 'my_job_listings_bloc.dart';

@immutable
abstract class MyJobListingsState extends BaseState {
  MyJobListingsState();
}

class MyJobListingsPageInitial extends MyJobListingsState {
  MyJobListingsPageInitial();
}

class SelectedTabChangedState extends MyJobListingsState {
  SelectedTabChangedState();
}
class MyJobListingsPageEnteredState extends MyJobListingsState {
  MyJobListingsPageEnteredState();
}
