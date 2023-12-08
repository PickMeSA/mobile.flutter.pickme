import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/jobs/shared/domain/usecases/get_industries_usecase.dart';
import 'package:pickme/shared/domain/entities/paginated_candidate_profile_entity.dart';
import 'package:pickme/shared/domain/entities/paginated_industry_object.dart';
import 'package:logger/logger.dart';

import '../../../../shared/domain/usecases/get_paginated_candidates_usecase.dart';

part 'jobs_hiring_landing_page_event.dart';
part 'jobs_hiring_landing_page_state.dart';

@injectable
class JobsHiringLandingPageBloc extends BaseBloc<JobsHiringLandingPageEvent, JobsHiringLandingPageState> {
  final GetIndustriesUseCase getIndustriesUseCase;
  PaginatedCandidateProfileEntity? paginatedCandidates;
  final GetPaginatedCandidatesByIndustryUseCase getPaginatedCandidatesByIndustryUseCase;
  PaginatedIndustryEntity? paginatedIndustries;
  bool preloaderActive = false;

  Logger logger = Logger();
  JobsHiringLandingPageBloc({required this.getIndustriesUseCase, required this.getPaginatedCandidatesByIndustryUseCase, }) : super(JobsHiringLandingPageInitial()) {
    on<JobsHiringLandingPageEnteredEvent>((event, emit) => _onJobsHiringLandingPageEnteredEvent(event, emit));
    on<SeeAllClickedEvent>((event, emit) => _onSeeAllClickedEventEvent(event, emit));
  }
  _onSeeAllClickedEventEvent(
      SeeAllClickedEvent event,
      Emitter<JobsHiringLandingPageState> emit
      ) {
  // go to all page
  }
  _onJobsHiringLandingPageEnteredEvent(
      JobsHiringLandingPageEnteredEvent event,
      Emitter<JobsHiringLandingPageState> emit
      )async{
    emit(GetTopIndustriesState()..dataState = DataState.loading);
    try{
      PaginatedIndustryEntity paginatedIndustryEntity = await getIndustriesUseCase.call(
          params: GetIndustriesUseCaseParams());
      paginatedIndustries = paginatedIndustryEntity;
      PaginatedCandidateProfileEntity paginatedCandidateProfileEntity = await getPaginatedCandidatesByIndustryUseCase.call(
          params: GetPaginatedCandidatesByIndustryUseCaseParams());
      paginatedCandidates = paginatedCandidateProfileEntity;

      emit(GetTopIndustriesState(paginatedIndustries: paginatedIndustryEntity, paginatedCandidates: paginatedCandidates)..dataState = DataState.success);
    }catch(ex){
      logger.e(ex);
      emit(GetTopIndustriesState()..dataState = DataState.error);
    }
  }
}
