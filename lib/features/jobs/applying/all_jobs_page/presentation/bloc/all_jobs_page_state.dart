part of 'all_jobs_page_bloc.dart';

@immutable
abstract class AllJobsPageState extends BaseState {
  final PaginatedIndustryEntity? paginatedIndustries;
  final String? searchText;
  AllJobsPageState({super.dataState, this.paginatedIndustries, this.searchText,});
}

class AllServicesPageInitial extends AllJobsPageState {
  AllServicesPageInitial({super.paginatedIndustries, super.searchText});
}

class AllServicesPageEnteredState extends AllJobsPageState {
  AllServicesPageEnteredState();
}
class GetIndustriesState extends AllJobsPageState {
  GetIndustriesState({super.paginatedIndustries});
}

class SearchTextChangedState extends AllJobsPageState {
  SearchTextChangedState({
    super.searchText
  });
}
