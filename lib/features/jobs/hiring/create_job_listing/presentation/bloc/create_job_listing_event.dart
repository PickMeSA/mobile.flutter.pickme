part of 'create_job_listing_bloc.dart';

@immutable
abstract class CreateJobListingsEvent extends BaseEvent {}

class SeeAllClickedEvent extends CreateJobListingsEvent{
  SeeAllClickedEvent();
}
class CreateJobListingPageEnteredEvent extends CreateJobListingsEvent{
  CreateJobListingPageEnteredEvent();
}

class JobImageAddedClickedEvent extends CreateJobListingsEvent{
  String filePath;
  JobImageAddedClickedEvent({required this.filePath});
}

class RemoveImageClickedEvent extends CreateJobListingsEvent{
  int index;
  RemoveImageClickedEvent({required this.index});
}
class FlexibleHoursCheckboxChangedEvent extends CreateJobListingsEvent{
  bool checked;
  FlexibleHoursCheckboxChangedEvent({required this.checked});
}

class GetSkillsListEvent extends CreateJobListingsEvent{
  GetSkillsListEvent();
}

class SkillChipDeletedEvent extends CreateJobListingsEvent{
  int index;
  SkillChipDeletedEvent({required this.index});
}


class SkillSelectedEvent extends CreateJobListingsEvent{
  final JobsSkillEntity skill;

  SkillSelectedEvent({required this.skill});
}
class CreateJobPageSubmitJobEvent extends CreateJobListingsEvent{
  final CreateJobPageJobEntity job;

  CreateJobPageSubmitJobEvent({required this.job});
}