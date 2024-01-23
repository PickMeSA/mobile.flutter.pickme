part of 'membership_information_bloc.dart';

@immutable
abstract class MembershipInformationState extends BaseState {
  String? error;

  MembershipInformationState({this.error});
}

class LandingInitial extends MembershipInformationState {}

class GetMembershipInformationState extends MembershipInformationState{
  GetMembershipInformationState({super.error});
}
