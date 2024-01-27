part of 'jobs_landing_page_bloc.dart';

@immutable
abstract class JobsLandingPageState extends BaseState {
  final String? error;
  JobsLandingPageState({super.dataState, this.error});
}

class JobsLandingPageInitial extends JobsLandingPageState {
  JobsLandingPageInitial();
}

class GetTopIndustriesState extends JobsLandingPageState {
  GetTopIndustriesState({super.error});
}
