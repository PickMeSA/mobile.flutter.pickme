part of 'candidate_profile_page_bloc.dart';

@immutable
abstract class CandidateProfilePageEvent extends BaseEvent {}

class SeeAllClickedEvent extends CandidateProfilePageEvent{
  SeeAllClickedEvent();
}
class CandidateProfilePageEnteredEvent extends CandidateProfilePageEvent{
  final CandidateProfileEntity candidateProfile;
  final String? jobInterestId;
  CandidateProfilePageEnteredEvent({required this.candidateProfile, this.jobInterestId});
}
class RespondToJobInterestEvent extends CandidateProfilePageEvent{
  final String status;
  RespondToJobInterestEvent({required this.status});
}

class SelectedTabChangedEvent extends CandidateProfilePageEvent{
  final int tabIndex;
  SelectedTabChangedEvent({required this.tabIndex});
}


class ReviewJobPageSubmitJobEvent extends CandidateProfilePageEvent{
  final CreateJobPageJobEntity job;

  ReviewJobPageSubmitJobEvent({required this.job});
}

