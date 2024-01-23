part of 'select_existing_job_listing_bloc.dart';

@immutable
abstract class SelectExistingJobState extends BaseState {
  final String? error;
  SelectExistingJobState({this.error});
}

class MyJobListingsPageInitial extends SelectExistingJobState {
  MyJobListingsPageInitial();
}

class SelectedJobChangedState extends SelectExistingJobState {
  SelectedJobChangedState();
}
class SelectExistingJobPageEnteredState extends SelectExistingJobState {
  SelectExistingJobPageEnteredState();
}

class SendJobOfferClickedState extends SelectExistingJobState {
  SendJobOfferClickedState({super.error});
}
