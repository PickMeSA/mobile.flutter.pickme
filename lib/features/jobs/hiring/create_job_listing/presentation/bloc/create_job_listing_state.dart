part of 'create_job_listing_bloc.dart';

@immutable
abstract class CreateJobListingState extends BaseState {
  String? error;

  CreateJobListingState({
    super.dataState,
    this.error
  });
}

class CreateJobListingInitial extends CreateJobListingState {
  CreateJobListingInitial();
}
class JobImageAddedState extends CreateJobListingState {
  JobImageAddedState({super.error});
}

class FlexibleHoursChangedState extends CreateJobListingState {
  FlexibleHoursChangedState();
}

class GetSkillsListState extends CreateJobListingState {
  GetSkillsListState({super.error});
}
