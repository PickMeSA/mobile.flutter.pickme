part of 'jobs_hiring_landing_page_bloc.dart';

@immutable
abstract class JobsHiringLandingPageState extends BaseState {
  final PaginatedIndustryEntity? paginatedIndustries;
  JobsHiringLandingPageState({super.dataState, this.paginatedIndustries});
}

class JobsHiringLandingPageInitial extends JobsHiringLandingPageState {
  JobsHiringLandingPageInitial({super.paginatedIndustries});
}

class GetTopIndustriesState extends JobsHiringLandingPageState {
  GetTopIndustriesState({super.paginatedIndustries});
}
