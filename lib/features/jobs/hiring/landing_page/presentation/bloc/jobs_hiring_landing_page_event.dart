part of 'jobs_hiring_landing_page_bloc.dart';

@immutable
abstract class JobsHiringLandingPageEvent extends BaseEvent {}

class SeeAllClickedEvent extends JobsHiringLandingPageEvent{
  SeeAllClickedEvent();
}
class JobsHiringLandingPageEnteredEvent extends JobsHiringLandingPageEvent{
  JobsHiringLandingPageEnteredEvent();
}


