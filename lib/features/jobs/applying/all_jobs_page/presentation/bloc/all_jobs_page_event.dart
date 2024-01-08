part of 'all_jobs_page_bloc.dart';

@immutable
abstract class AlljobsPageEvent extends BaseEvent {}

class AllServicesPageEnteredEvent extends AlljobsPageEvent{
  AllServicesPageEnteredEvent();
}

class SearchTextChangedEvent extends AlljobsPageEvent{
  final String searchText;
  SearchTextChangedEvent({required this.searchText});
}
