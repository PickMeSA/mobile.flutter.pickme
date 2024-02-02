part of 'review_job_listing_details_bloc.dart';

@immutable
abstract class ReviewJobEvent extends BaseEvent {}

class SeeAllClickedEvent extends ReviewJobEvent{
  SeeAllClickedEvent();
}
class ReviewJobListingInfoPageEnteredEvent extends ReviewJobEvent{
  ReviewJobListingInfoPageEnteredEvent();
}

class SelectedTabChangedEvent extends ReviewJobEvent{
  final int tabIndex;
  SelectedTabChangedEvent({required this.tabIndex});
}
class SendJobOfferEvent extends ReviewJobEvent{
  final CreateJobPageJobEntity job;
  final CandidateProfileEntity candidateProfileEntity;

  SendJobOfferEvent({required this.job, required this.candidateProfileEntity});
}

class ReviewJobPageSubmitJobEvent extends ReviewJobEvent{
  final CreateJobPageJobEntity job;
  ReviewJobPageSubmitJobEvent({required this.job});
}