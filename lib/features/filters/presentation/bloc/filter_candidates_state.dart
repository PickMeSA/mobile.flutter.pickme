part of 'filter_candidates_bloc.dart';

@immutable
abstract class FilterCandidatesState extends BaseState {
  FilterCandidatesState();
}

class FilterCandidatesInitial extends FilterCandidatesState {
  FilterCandidatesInitial();
}
class FilterCandidatesPageEnteredState extends FilterCandidatesState {
  FilterCandidatesPageEnteredState();
}

class MaxDistanceChangedState extends FilterCandidatesState {
  MaxDistanceChangedState();
}

class PriceRangeChangedState extends FilterCandidatesState {
  PriceRangeChangedState();
}

