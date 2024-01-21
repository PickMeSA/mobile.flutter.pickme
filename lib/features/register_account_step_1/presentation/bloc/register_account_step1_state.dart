part of 'register_account_step1_bloc.dart';

@immutable
abstract class RegisterAccountStep1State extends BaseState {
  final bool checked;
  String? error;
  RegisterAccountStep1State({this.error,super.dataState, required this.checked});

}

class RegisterAccountStep1Initial extends RegisterAccountStep1State {
  RegisterAccountStep1Initial({required super.checked});
}

class TermsAndConditionsToggledState extends RegisterAccountStep1State {
  TermsAndConditionsToggledState({required super.checked});
}

class RegisterAccountRemoteSubmitStep1State extends RegisterAccountStep1State{
  RegisterAccountRemoteSubmitStep1State({required super.checked});

}

class SubmitAcceptedTermsAndConditionsState extends RegisterAccountStep1State{
  SubmitAcceptedTermsAndConditionsState({required super.checked, super.error});

}
