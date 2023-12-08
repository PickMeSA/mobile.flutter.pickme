part of 'jobs_landing_page_bloc.dart';

@immutable
abstract class JobsLandingPageState extends BaseState {
  JobsLandingPageState({super.dataState});

}

class JobsLandingPageInitial extends JobsLandingPageState {
  JobsLandingPageInitial();
}

class SeeAllClickedState extends JobsLandingPageState {
  SeeAllClickedState();
}
