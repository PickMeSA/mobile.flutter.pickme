part of 'register_account_step1_bloc.dart';

@immutable
abstract class RegisterAccountStep1Event extends BaseEvent {}

class TermsAndConditionsToggledEvent extends RegisterAccountStep1Event{
  TermsAndConditionsToggledEvent();
}
