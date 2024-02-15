part of 'apply_for_job_bloc.dart';
@immutable
abstract class ApplyForJobPageState extends BaseState {
  String? error;

  ApplyForJobPageState({this.error});
}

class ApplyForJobPageInitState extends ApplyForJobPageState  {}

class ApplyForJobClickedState extends ApplyForJobPageState  {
  final String? error;
  ApplyForJobClickedState({this.error});
}

class UpdateJobDateTimeState extends ApplyForJobPageState{
 UpdateJobDateTimeState({super.error});
}

class RespondToJobInterestState extends ApplyForJobPageState{

  RespondToJobInterestState({super.error});
}

