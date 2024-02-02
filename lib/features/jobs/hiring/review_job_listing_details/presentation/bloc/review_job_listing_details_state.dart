part of 'review_job_listing_details_bloc.dart';

@immutable
abstract class ReviewJobListingState extends BaseState {
  String? error;
  ReviewJobListingState({this.error});
}

class ReviewJobListingStatePageInitial extends ReviewJobListingState {
  ReviewJobListingStatePageInitial();
}

class ReviewJobListingInfoPageEnteredState extends ReviewJobListingState {
  ReviewJobListingInfoPageEnteredState();
}

class ReviewJobPageSubmitJobState extends ReviewJobListingState {
  ReviewJobPageSubmitJobState({super.error});
}

class SendJobOfferState extends ReviewJobListingState {
  SendJobOfferState({super.error});
}
