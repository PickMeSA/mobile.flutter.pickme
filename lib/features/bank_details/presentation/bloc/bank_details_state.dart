part of 'bank_details_bloc.dart';
@immutable
abstract class BankDetailsPageState extends BaseState {}

class BankDetailsPageInitState extends BankDetailsPageState  {}

class BankDetailsPageEnteredState extends BankDetailsPageState{

}

class BankDetailsValueChangedState extends BankDetailsPageState{

}

class BankDetailsSubmittedState extends BankDetailsPageState{
  final ProfileEntity? profileEntity;

  BankDetailsSubmittedState({this.profileEntity});
}

