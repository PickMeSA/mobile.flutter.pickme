part of 'my_job_listings_bloc.dart';

@immutable
abstract class MyJobListingsState extends BaseState {
  final PaginatedIndustryEntity? paginatedIndustries;
  final int selectedTabIndex;
  MyJobListingsState({
    super.dataState,
    this.paginatedIndustries,
    required this.selectedTabIndex
  });
}

class MyJobListingsPageInitial extends MyJobListingsState {
  MyJobListingsPageInitial({
    super.paginatedIndustries,
    required super.selectedTabIndex
  });
}

class SelectedTabChangedState extends MyJobListingsState {
  SelectedTabChangedState({
    super.paginatedIndustries,
    required super.selectedTabIndex
  });
}
class GetTopIndustriesState extends MyJobListingsState {
  GetTopIndustriesState({
    super.paginatedIndustries,
    required super.selectedTabIndex
  });
}
