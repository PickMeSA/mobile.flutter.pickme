part of 'job_list_page_bloc.dart';

@immutable
abstract class JobListPageState extends BaseState {
  JobListPageState();
}

class MyJobListingsPageInitial extends JobListPageState {
  MyJobListingsPageInitial();
}

class SelectedJobChangedState extends JobListPageState {
  SelectedJobChangedState();
}
class MyJobListingsPageEnteredState extends JobListPageState {
  final String? error;
  MyJobListingsPageEnteredState({this.error});
}

class SendJobOfferClickedState extends JobListPageState {
  final String? error;
  SendJobOfferClickedState({this.error});
}
class FilterChangedState extends JobListPageState {
  final String? error;
  FilterChangedState({this.error});
}
