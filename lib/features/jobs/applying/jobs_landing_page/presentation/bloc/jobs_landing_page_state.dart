part of 'jobs_landing_page_bloc.dart';

@immutable
abstract class JobsLandingPageState extends BaseState {
  final bool checked;

  JobsLandingPageState({super.dataState, required this.checked});

}

class JobsLandingPageInitial extends JobsLandingPageState {
  JobsLandingPageInitial({required super.checked});
}

class TermsAndConditionsToggledState extends JobsLandingPageState {
  TermsAndConditionsToggledState({required super.checked});
}
