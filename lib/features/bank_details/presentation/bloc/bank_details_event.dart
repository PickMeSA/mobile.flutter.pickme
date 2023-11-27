part of 'bank_details_bloc.dart';
 @immutable
abstract class BankDetailsPageEvent extends BaseEvent {}

class BankDetailsValueChangedEvent extends BankDetailsPageEvent{
  final BankDetailsEntity bankDetailsEntity;

  BankDetailsValueChangedEvent({required this.bankDetailsEntity});
}
