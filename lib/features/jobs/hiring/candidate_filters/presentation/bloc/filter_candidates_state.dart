part of 'filter_candidates_bloc.dart';

@immutable
abstract class FilterCandidatesState extends BaseState {
  final double maxDistance;
  final RangeValues priceRange;

  FilterCandidatesState({
    super.dataState,
    required this.maxDistance,
    required this.priceRange
  });
}

class FilterCandidatesInitial extends FilterCandidatesState {
  FilterCandidatesInitial({
    required super.maxDistance,
    required super.priceRange,
});
}

class MaxDistanceChangedState extends FilterCandidatesState {
  MaxDistanceChangedState({
    required super.maxDistance,
    required super.priceRange,
  });
}

class PriceRangeChangedState extends FilterCandidatesState {
  PriceRangeChangedState({
    required super.maxDistance,
    required super.priceRange,
  });
}

