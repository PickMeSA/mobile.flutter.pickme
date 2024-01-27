part of 'apply_for_job_bloc.dart';
@immutable
abstract class ApplyForJobPageState extends BaseState {}

class ApplyForJobPageInitState extends ApplyForJobPageState  {}

class ApplyForJobClickedState extends ApplyForJobPageState  {
  final String? error;
  ApplyForJobClickedState({this.error});
}

