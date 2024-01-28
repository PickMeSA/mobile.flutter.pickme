part of 'job_offers_list_page_bloc.dart';

@immutable
abstract class JobOffersListPageEvent extends BaseEvent {}

class SeeAllClickedEvent extends JobOffersListPageEvent{
  SeeAllClickedEvent();
}
class MyJobListingsPageEnteredEvent extends JobOffersListPageEvent{
  MyJobListingsPageEnteredEvent();
}

class JobSelectedEvent extends JobOffersListPageEvent{
  final JobEntity job;
  JobSelectedEvent({required this.job});
}

class SendJobOfferClickedEvent extends JobOffersListPageEvent{
  final CandidateProfileEntity candidateProfileEntity;
  SendJobOfferClickedEvent({ required this.candidateProfileEntity});
}


class FilterChangedEvent extends JobOffersListPageEvent{
  final FilterEntity filterEntity;
  FilterChangedEvent({required this.filterEntity});
}
