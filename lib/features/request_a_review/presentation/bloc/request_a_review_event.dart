part of 'request_a_review_bloc.dart';

@immutable
abstract class RequestAReviewEvent extends BaseEvent {}

class SeeAllClickedEvent extends RequestAReviewEvent{
  SeeAllClickedEvent();
}

class SelectedOfferTypeChangedEvent extends RequestAReviewEvent{
  final String offerType;
  SelectedOfferTypeChangedEvent({required this.offerType});
}


