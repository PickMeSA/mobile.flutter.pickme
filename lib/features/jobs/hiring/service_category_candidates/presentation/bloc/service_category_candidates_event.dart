part of 'service_category_candidates_bloc.dart';

@immutable
abstract class ServiceCategoryCandidatesEvent extends BaseEvent {}

class ServiceCategoryCandidatesPageEnteredEvent extends ServiceCategoryCandidatesEvent{
  final int? serviceCategoryId;
  ServiceCategoryCandidatesPageEnteredEvent({this.serviceCategoryId});
}


class LoadMoreClickedEvent extends ServiceCategoryCandidatesEvent{
  final String? serviceCategoryId;
  final PaginationEntity paginationEntity;
  LoadMoreClickedEvent({required this.paginationEntity, this.serviceCategoryId});
}


