part of 'job_offers_list_page_bloc.dart';

@immutable
abstract class JobOffersListPageState extends BaseState {
  JobOffersListPageState();
}

class MyJobListingsPageInitial extends JobOffersListPageState {
  MyJobListingsPageInitial();
}

class SelectedJobChangedState extends JobOffersListPageState {
  SelectedJobChangedState();
}
class MyJobListingsPageEnteredState extends JobOffersListPageState {
  final String? error;
  MyJobListingsPageEnteredState({this.error});
}

class SendJobOfferClickedState extends JobOffersListPageState {
  final String? error;
  SendJobOfferClickedState({this.error});
}
class FilterChangedState extends JobOffersListPageState {
  final String? error;
  FilterChangedState({this.error});
}
