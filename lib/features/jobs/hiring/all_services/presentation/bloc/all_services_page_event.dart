part of 'all_services_page_bloc.dart';

@immutable
abstract class AllServicesPageEvent extends BaseEvent {}

class AllServicesPageEnteredEvent extends AllServicesPageEvent{
  AllServicesPageEnteredEvent();
}

class SearchTextChangedEvent extends AllServicesPageEvent{
  final String searchText;
  SearchTextChangedEvent({required this.searchText});
}

class FilterChangedEvent extends AllServicesPageEvent{
  final FilterEntity filterEntity;
  FilterChangedEvent({required this.filterEntity});
}
