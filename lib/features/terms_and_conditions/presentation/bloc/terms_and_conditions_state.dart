part of 'terms_and_conditions_bloc.dart';

@immutable
abstract class TermsAndConditionsState extends BaseState {
  String? error;

  TermsAndConditionsState({this.error});
}

class LandingInitial extends TermsAndConditionsState {}

class GetRemoteTermsAndConditionsState extends  TermsAndConditionsState{

  GetRemoteTermsAndConditionsState({ super.error});
}

class SubmitTermsAndConditionsAcceptanceState extends TermsAndConditionsState{

  SubmitTermsAndConditionsAcceptanceState({super.error});
}
