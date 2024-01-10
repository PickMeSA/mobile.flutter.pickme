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
class SelectExistingJobPageEnteredState extends JobListPageState {
  SelectExistingJobPageEnteredState();
}

class SendJobOfferClickedState extends JobListPageState {
  SendJobOfferClickedState();
}
class FilterChangedState extends JobListPageState {
  FilterChangedState();
}
