import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/domain/entities/paginated_industry_object.dart';

import '../../../../shared/domain/usecases/get_industries_usecase.dart';
import '../../../../shared/domain/usecases/get_paginated_candidates_usecase.dart';

part 'jobs_landing_page_event.dart';
part 'jobs_landing_page_state.dart';

@injectable
class JobsLandingPageBloc extends BaseBloc<JobsLandingPageEvent, JobsLandingPageState> {
  final GetIndustriesUseCase getIndustriesUseCase;
  final GetPaginatedCandidatesByIndustryUseCase getPaginatedCandidatesByIndustryUseCase;
  PaginatedIndustryEntity? paginatedIndustries;
  bool preloaderActive = false;
  JobsLandingPageBloc(
      {required this.getIndustriesUseCase,
      required this.getPaginatedCandidatesByIndustryUseCase}) : super(JobsLandingPageInitial()) {
    on<JobsLandingPageEnteredEvent>((event, emit) => _onJobsLandingPageEnteredEvent(event, emit));
  }
  _onJobsLandingPageEnteredEvent(
      JobsLandingPageEnteredEvent event,
      Emitter<JobsLandingPageState> emit
      ) async{
    emit(GetTopIndustriesState()..dataState = DataState.loading);
    try{
      PaginatedIndustryEntity paginatedIndustryEntity = await getIndustriesUseCase.call(
          params: GetIndustriesUseCaseParams());
      paginatedIndustries = paginatedIndustryEntity;
      logger.i(paginatedIndustries);
      emit(GetTopIndustriesState()..dataState = DataState.success);
    }catch(ex){
      emit(GetTopIndustriesState()..dataState = DataState.error);
    }
  }
}
