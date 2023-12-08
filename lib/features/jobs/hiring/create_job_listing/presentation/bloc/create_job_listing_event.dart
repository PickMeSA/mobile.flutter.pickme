part of 'create_job_listing_bloc.dart';

@immutable
abstract class MyJobListingsEvent extends BaseEvent {}

class SeeAllClickedEvent extends MyJobListingsEvent{
  SeeAllClickedEvent();
}
class CreateJobListingPageEnteredEvent extends MyJobListingsEvent{
  CreateJobListingPageEnteredEvent();
}

class SelectedTabChangedEvent extends MyJobListingsEvent{
  final int tabIndex;
  SelectedTabChangedEvent({required this.tabIndex});
}


