part of 'candidate_profile_page_bloc.dart';

@immutable
abstract class CandidateProfilePageEvent extends BaseEvent {}

class SeeAllClickedEvent extends CandidateProfilePageEvent{
  SeeAllClickedEvent();
}
class CandidateProfilePageEnteredEvent extends CandidateProfilePageEvent{
  final CandidateProfileEntity candidateProfile;
  CandidateProfilePageEnteredEvent({required this.candidateProfile});
}

class SelectedTabChangedEvent extends CandidateProfilePageEvent{
  final int tabIndex;
  SelectedTabChangedEvent({required this.tabIndex});
}


class ReviewJobPageSubmitJobEvent extends CandidateProfilePageEvent{
  final CreateJobPageJobEntity job;

  ReviewJobPageSubmitJobEvent({required this.job});
}

