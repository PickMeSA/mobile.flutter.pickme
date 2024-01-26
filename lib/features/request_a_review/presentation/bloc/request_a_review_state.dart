part of 'request_a_review_bloc.dart';

@immutable
abstract class RequestAReviewState extends BaseState {
  RequestAReviewState();
}

class MyJobListingsPageInitial extends RequestAReviewState {
  MyJobListingsPageInitial();
}

class SelectedOfferTypeChangedState extends RequestAReviewState {
  SelectedOfferTypeChangedState();
}
