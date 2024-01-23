part of 'offer_a_job_bloc.dart';

@immutable
abstract class OfferAJobEvent extends BaseEvent {}

class SeeAllClickedEvent extends OfferAJobEvent{
  SeeAllClickedEvent();
}

class SelectedOfferTypeChangedEvent extends OfferAJobEvent{
  final String offerType;
  SelectedOfferTypeChangedEvent({required this.offerType});
}


