part of 'service_category_candidates_bloc.dart';

@immutable
abstract class ServiceCategoryCandidatesState extends BaseState {
  final PaginatedCandidateProfileEntity? paginatedCandidates;
  ServiceCategoryCandidatesState({super.dataState, this.paginatedCandidates});
}

class ServiceCategoryCandidatesInitial extends ServiceCategoryCandidatesState {
  ServiceCategoryCandidatesInitial({super.paginatedCandidates});
}

class GetServiceCategoryCandidatesState extends ServiceCategoryCandidatesState {
  GetServiceCategoryCandidatesState({super.paginatedCandidates});
}
class FilterChangedState extends ServiceCategoryCandidatesState {
  FilterChangedState();
}
