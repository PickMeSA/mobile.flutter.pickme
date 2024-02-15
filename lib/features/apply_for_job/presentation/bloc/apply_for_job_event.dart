part of 'apply_for_job_bloc.dart';
 @immutable
abstract class ApplyForJobPageEvent extends BaseEvent {}

class ApplyForJobPageEnteredEvent extends ApplyForJobPageEvent{
  final JobEntity jobEntity;
 ApplyForJobPageEnteredEvent({required this.jobEntity});
}

class ApplyForJobClickedEvent extends ApplyForJobPageEvent{
  final DateTime startDate;
  final DateTime endDate;
  final String startTime;
  final String comments;
  ApplyForJobClickedEvent({
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.comments,
  });
}

class UpdateJobDateTimeEvent extends ApplyForJobPageEvent{
   final JobEntity jobEntity;
   final DateAndTime dateAndTime;

   UpdateJobDateTimeEvent({required this.jobEntity, required this.dateAndTime});
}

class RespondToJobInterestEvent extends ApplyForJobPageEvent{
   final JobEntity jobEntity;
  final String status;
  RespondToJobInterestEvent({required this.jobEntity,required this.status});
}