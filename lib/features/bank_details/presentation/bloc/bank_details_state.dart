part of 'bank_details_bloc.dart';
@immutable
abstract class BankDetailsPageState extends BaseState {
  String? error;

  BankDetailsPageState({ this.error});
}

class BankDetailsPageInitState extends BankDetailsPageState  {}

class BankDetailsPageEnteredState extends BankDetailsPageState{

}

class BankDetailsValueChangedState extends BankDetailsPageState{

}

class BankDetailsSubmittedState extends BankDetailsPageState{
  final ProfileEntity? profileEntity;

  BankDetailsSubmittedState({this.profileEntity, super.error});
}

