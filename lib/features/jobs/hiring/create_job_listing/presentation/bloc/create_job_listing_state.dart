part of 'create_job_listing_bloc.dart';

@immutable
abstract class CreateJobListingState extends BaseState {
  final PaginatedIndustryEntity? paginatedIndustries;
  final int selectedTabIndex;
  CreateJobListingState({
    super.dataState,
    this.paginatedIndustries,
    required this.selectedTabIndex
  });
}

class MyJobListingsPageInitial extends CreateJobListingState {
  MyJobListingsPageInitial({
    super.paginatedIndustries,
    required super.selectedTabIndex
  });
}

class SelectedTabChangedState extends CreateJobListingState {
  SelectedTabChangedState({
    super.paginatedIndustries,
    required super.selectedTabIndex
  });
}
class GetTopIndustriesState extends CreateJobListingState {
  GetTopIndustriesState({
    super.paginatedIndustries,
    required super.selectedTabIndex
  });
}
