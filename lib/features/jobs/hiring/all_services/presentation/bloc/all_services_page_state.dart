part of 'all_services_page_bloc.dart';

@immutable
abstract class AllServicesPageState extends BaseState {
  final PaginatedIndustryEntity? paginatedIndustries;
  final String? searchText;
  AllServicesPageState({super.dataState, this.paginatedIndustries, this.searchText,});
}

class AllServicesPageInitial extends AllServicesPageState {
  AllServicesPageInitial({super.paginatedIndustries, super.searchText});
}

class AllServicesPageEnteredState extends AllServicesPageState {
  AllServicesPageEnteredState();
}
class GetIndustriesState extends AllServicesPageState {
  GetIndustriesState({super.paginatedIndustries});
}

class SearchTextChangedState extends AllServicesPageState {
  SearchTextChangedState({
    super.searchText
  });
}

class SubmitSearchState extends AllServicesPageState {
  SubmitSearchState({
    super.searchText
  });
}
