part of 'offer_a_job_bloc.dart';

@immutable
abstract class OfferAJobState extends BaseState {
  OfferAJobState();
}

class MyJobListingsPageInitial extends OfferAJobState {
  MyJobListingsPageInitial();
}

class SelectedOfferTypeChangedState extends OfferAJobState {
  SelectedOfferTypeChangedState();
}
