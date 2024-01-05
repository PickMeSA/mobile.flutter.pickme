part of 'select_existing_job_listing_bloc.dart';

@immutable
abstract class SelectExistingJobEvent extends BaseEvent {}

class SeeAllClickedEvent extends SelectExistingJobEvent{
  SeeAllClickedEvent();
}
class MyJobListingsPageEnteredEvent extends SelectExistingJobEvent{
  MyJobListingsPageEnteredEvent();
}

class JobSelectedEvent extends SelectExistingJobEvent{
  final JobEntity job;
  JobSelectedEvent({required this.job});
}

class SendJobOfferClickedEvent extends SelectExistingJobEvent{
  final CandidateProfileEntity candidateProfileEntity;
  SendJobOfferClickedEvent({ required this.candidateProfileEntity});
}


