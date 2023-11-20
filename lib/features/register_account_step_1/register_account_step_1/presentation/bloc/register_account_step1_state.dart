part of 'register_account_step1_bloc.dart';

@immutable
abstract class RegisterAccountStep1State extends BaseState {
  final bool checked;

  RegisterAccountStep1State({super.dataState, required this.checked});

}

class RegisterAccountStep1Initial extends RegisterAccountStep1State {
  RegisterAccountStep1Initial({required super.checked});
}

class TermsAndConditionsToggledState extends RegisterAccountStep1State {
  TermsAndConditionsToggledState({required super.checked});
}
