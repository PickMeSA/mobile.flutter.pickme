part of 'filter_candidates_bloc.dart';

@immutable
abstract class FilterCandidatesEvent extends BaseEvent {}

class FilterCandidatesPageEnteredEvent extends FilterCandidatesEvent{
  final int? serviceCategoryId;
  final double maxDistance;
  final RangeValues priceRange;
  FilterCandidatesPageEnteredEvent({
    required this.maxDistance,
    required this.priceRange,
    this.serviceCategoryId
  });
}


class MaxDistanceChangedEvent extends FilterCandidatesEvent{
  final double maxDistance;
  MaxDistanceChangedEvent({required this.maxDistance});
}

class PriceRangeChangedEvent extends FilterCandidatesEvent{
  final RangeValues priceRange;
  PriceRangeChangedEvent({required this.priceRange});
}


