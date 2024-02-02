part of 'all_services_page_bloc.dart';

@immutable
abstract class AllServicesPageEvent extends BaseEvent {}

class AllServicesPageEnteredEvent extends AllServicesPageEvent{
  AllServicesPageEnteredEvent();
}

class SearchTextChangedEvent extends AllServicesPageEvent{
  final String searchText;
  final String address;
  SearchTextChangedEvent({required this.searchText, required this.address});
}

class FilterChangedEvent extends AllServicesPageEvent{
  final FilterEntity filterEntity;
  FilterChangedEvent({required this.filterEntity});
}
