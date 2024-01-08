part of 'select_existing_job_listing_bloc.dart';

@immutable
abstract class SelectExistingJobState extends BaseState {
  SelectExistingJobState();
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
  SendJobOfferClickedState();
}
