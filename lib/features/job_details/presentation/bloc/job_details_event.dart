part of 'job_details_bloc.dart';
 @immutable
abstract class JobDetailsPageEvent extends BaseEvent {}

class GetFullJobDetailsEvent extends JobDetailsPageEvent{
  final String jobId;

  GetFullJobDetailsEvent({required this.jobId});
}
