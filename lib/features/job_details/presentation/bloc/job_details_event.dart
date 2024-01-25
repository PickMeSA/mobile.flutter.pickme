part of 'job_details_bloc.dart';
 @immutable
abstract class JobDetailsPageEvent extends BaseEvent {}

class GetFullJobDetailsEvent extends JobDetailsPageEvent{
  final String jobId;
  JobEntity? job;
  GetFullJobDetailsEvent({required this.jobId, this.job});
}
