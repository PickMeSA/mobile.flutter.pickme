part of 'candidate_profile_page_bloc.dart';

@immutable
abstract class CandidateProfilePageState extends BaseState {
  CandidateProfilePageState();
}

class CandidateProfileStatePageInitial extends CandidateProfilePageState {
  CandidateProfileStatePageInitial();
}

class CandidateProfilePageEnteredState extends CandidateProfilePageState {
  CandidateProfilePageEnteredState();
}

class RespondToJobInterestState extends CandidateProfilePageState {
  String? error;
  RespondToJobInterestState({this.error});
}

class RemoveCandidateFromMatchesState extends CandidateProfilePageState {
  String? error;
  RemoveCandidateFromMatchesState({this.error});
}
