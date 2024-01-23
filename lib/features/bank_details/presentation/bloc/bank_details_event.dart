part of 'bank_details_bloc.dart';
 @immutable
abstract class BankDetailsPageEvent extends BaseEvent {}

class BankDetailsPageEnteredEvent extends BankDetailsPageEvent{
  BankDetailsPageEnteredEvent();
}

class BankDetailsValueChangedEvent extends BankDetailsPageEvent{
  final BankDetailsEntity bankDetailsEntity;

  BankDetailsValueChangedEvent({required this.bankDetailsEntity});
}

class BankDetailsSubmittedEvent extends BankDetailsPageEvent{
  final BankDetailsEntity bankDetailsEntity;

  BankDetailsSubmittedEvent({required this.bankDetailsEntity});
}
