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

class SkillSelectedState extends CreateJobListingState {
  SkillSelectedState({super.error});
}

class SkillChipDeletedState extends CreateJobListingState{

}
class CreateJobPageSubmitJobState extends CreateJobListingState{

}
class LocationFromProfileToggledState extends CreateJobListingState{
  final LocationSource locationSource;

  LocationFromProfileToggledState({super.dataState, super.error, required this.locationSource});
}

enum LocationSource{profile, currentLocation, map}