part of 'job_list_page_bloc.dart';

@immutable
abstract class JobListPageEvent extends BaseEvent {}

class SeeAllClickedEvent extends JobListPageEvent{
  SeeAllClickedEvent();
}
class MyJobListingsPageEnteredEvent extends JobListPageEvent{
  final FilterEntity filter;
  final JobListMode pageMode;
  MyJobListingsPageEnteredEvent({required this.filter, required this.pageMode});
}

class JobSelectedEvent extends JobListPageEvent{
  final JobEntity job;
  JobSelectedEvent({required this.job});
}

class SendJobOfferClickedEvent extends JobListPageEvent{
  final CandidateProfileEntity candidateProfileEntity;
  SendJobOfferClickedEvent({ required this.candidateProfileEntity});
}


class FilterChangedEvent extends JobListPageEvent{
  final FilterEntity filterEntity;
  FilterChangedEvent({required this.filterEntity});
}
