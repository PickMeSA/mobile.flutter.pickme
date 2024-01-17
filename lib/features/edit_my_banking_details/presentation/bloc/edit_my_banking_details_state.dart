part of 'edit_my_banking_details_bloc.dart';
@immutable
abstract class EditMyBankingDetailsPageState extends BaseState {

  String? error;

  EditMyBankingDetailsPageState({this.error});
}

class EditMyBankingDetailsPageInitState extends EditMyBankingDetailsPageState  {}

class BankDetailsValueChangedState extends EditMyBankingDetailsPageState{

}

class BankDetailsSubmittedState extends EditMyBankingDetailsPageState{
  final ProfileEntity? profileEntity;

  BankDetailsSubmittedState({this.profileEntity, super.error});
}
class BankDetailsPageEnteredState extends EditMyBankingDetailsPageState{

}