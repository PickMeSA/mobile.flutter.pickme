part of 'service_category_candidates_bloc.dart';

@immutable
abstract class ServiceCategoryCandidatesEvent extends BaseEvent {}

class ServiceCategoryCandidatesPageEnteredEvent extends ServiceCategoryCandidatesEvent{
  final String? serviceCategoryId;
  final FilterEntity? filter;
  ServiceCategoryCandidatesPageEnteredEvent({this.serviceCategoryId, this.filter});
}


class LoadMoreClickedEvent extends ServiceCategoryCandidatesEvent{
  final String? serviceCategoryId;
  final PaginationEntity paginationEntity;
  LoadMoreClickedEvent({required this.paginationEntity, this.serviceCategoryId});
}

class FilterChangedEvent extends ServiceCategoryCandidatesEvent{
  final FilterEntity filterEntity;
  FilterChangedEvent({required this.filterEntity});
}
