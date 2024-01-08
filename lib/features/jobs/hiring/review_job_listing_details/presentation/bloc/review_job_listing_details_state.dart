part of 'review_job_listing_details_bloc.dart';

@immutable
abstract class ReviewJobListingState extends BaseState {
  ReviewJobListingState();
}

class ReviewJobListingStatePageInitial extends ReviewJobListingState {
  ReviewJobListingStatePageInitial();
}

class ReviewJobListingInfoPageEnteredState extends ReviewJobListingState {
  ReviewJobListingInfoPageEnteredState();
}

class ReviewJobPageSubmitJobState extends ReviewJobListingState {
  ReviewJobPageSubmitJobState();
}

class SendJobOfferState extends ReviewJobListingState {
  SendJobOfferState();
}
