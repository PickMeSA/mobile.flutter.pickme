part of 'my_banking_details_bloc.dart';
@immutable
abstract class MyBankingDetailsPageState extends BaseState {
  String? error;

  MyBankingDetailsPageState({ this.error});
}

class MyBankingDetailsPageInitState extends MyBankingDetailsPageState  {}

class GetBankingDetailsState extends MyBankingDetailsPageState{

  GetBankingDetailsState({super.error});
}