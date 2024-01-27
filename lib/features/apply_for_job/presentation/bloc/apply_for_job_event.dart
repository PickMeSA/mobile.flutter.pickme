part of 'apply_for_job_bloc.dart';
 @immutable
abstract class ApplyForJobPageEvent extends BaseEvent {}

class ApplyForJobPageEnteredEvent extends ApplyForJobPageEvent{
  final JobEntity jobEntity;
 ApplyForJobPageEnteredEvent({required this.jobEntity});
}