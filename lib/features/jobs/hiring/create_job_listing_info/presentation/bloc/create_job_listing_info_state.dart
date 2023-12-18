part of 'create_job_listing_info_bloc.dart';

@immutable
abstract class CreateJobListingState extends BaseState {
  CreateJobListingState();
}

class MyJobListingsPageInitial extends CreateJobListingState {
  MyJobListingsPageInitial();
}

class CreateJobListingInfoPageEnteredState extends CreateJobListingState {
  CreateJobListingInfoPageEnteredState();
}
