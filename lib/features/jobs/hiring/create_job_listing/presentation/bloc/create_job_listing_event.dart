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


