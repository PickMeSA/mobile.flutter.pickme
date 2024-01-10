part of 'filter_candidates_bloc.dart';

@immutable
abstract class FilterCandidatesEvent extends BaseEvent {}

class FilterCandidatesPageEnteredEvent extends FilterCandidatesEvent{
  FilterEntity? filterEntity;
  FilterCandidatesPageEnteredEvent({
    this.filterEntity
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
class EstimatedHoursChangedEvent extends FilterCandidatesEvent{
  final double estimatedHours;
  EstimatedHoursChangedEvent({required this.estimatedHours});
}
class RatingChangedEvent extends FilterCandidatesEvent{
  final int rating;
  RatingChangedEvent({required this.rating});
}
class ResetClickedEvent extends FilterCandidatesEvent{
  ResetClickedEvent();
}


