part of 'create_job_listing_info_bloc.dart';

@immutable
abstract class MyJobListingsEvent extends BaseEvent {}

class SeeAllClickedEvent extends MyJobListingsEvent{
  SeeAllClickedEvent();
}
class CreateJobListingInfoPageEnteredEvent extends MyJobListingsEvent{
  CreateJobListingInfoPageEnteredEvent();
}

class SelectedTabChangedEvent extends MyJobListingsEvent{
  final int tabIndex;
  SelectedTabChangedEvent({required this.tabIndex});
}


