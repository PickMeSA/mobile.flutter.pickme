part of 'job_details_bloc.dart';
@immutable
abstract class JobDetailsPageState extends BaseState {}

class JobDetailsPageInitState extends JobDetailsPageState  {}

class GetFullJobDetailsState extends JobDetailsPageState{
  final String? error;
  GetFullJobDetailsState({this.error});
}
class ApplyForJobState extends JobDetailsPageState{
  final String? error;
  ApplyForJobState({this.error});
}

class RespondToJobInterestState extends JobDetailsPageState{
  final String? error;
  RespondToJobInterestState({this.error});
}

