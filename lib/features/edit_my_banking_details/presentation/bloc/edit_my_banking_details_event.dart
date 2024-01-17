part of 'edit_my_banking_details_bloc.dart';
 @immutable
abstract class EditMyBankingDetailsPageEvent extends BaseEvent {}

class BankDetailsValueChangedEvent extends EditMyBankingDetailsPageEvent{
 final BankDetailsEntity bankDetailsEntity;

 BankDetailsValueChangedEvent({required this.bankDetailsEntity});
}

class BankDetailsSubmittedEvent extends EditMyBankingDetailsPageEvent{
 final BankDetailsEntity bankDetailsEntity;

 BankDetailsSubmittedEvent({required this.bankDetailsEntity});
}

class BankDetailsPageEnteredEvent extends EditMyBankingDetailsPageEvent{
 BankDetailsPageEnteredEvent();
}
