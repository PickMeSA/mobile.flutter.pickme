part of 'jobs_landing_page_bloc.dart';

@immutable
abstract class JobsLandingPageEvent extends BaseEvent {}

class JobsLandingPageEnteredEvent extends JobsLandingPageEvent{
  JobsLandingPageEnteredEvent();
}
