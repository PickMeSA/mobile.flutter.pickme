import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/shared/classes/debouncer.dart';
import 'package:pickme/shared/domain/entities/paginated_industry_object.dart';

import '../../../../shared/domain/usecases/get_industries_usecase.dart';
import '../../../../shared/domain/usecases/get_paginated_candidates_usecase.dart';

part 'all_jobs_page_event.dart';
part 'all_jobs_page_state.dart';

@injectable
class AllJobsPageBloc extends BaseBloc<AlljobsPageEvent, AllJobsPageState> {

  final GetIndustriesUseCase getIndustriesUseCase;
  final GetPaginatedCandidatesByIndustryUseCase getPaginatedCandidatesByIndustryUseCase;
  PaginatedIndustryEntity? paginatedIndustries;
  bool preloaderActive = false;
  final Logger logger = Logger();

  AllJobsPageBloc({
    required this.getIndustriesUseCase,
    required this.getPaginatedCandidatesByIndustryUseCase}) : super(AllServicesPageInitial()) {
    on<AllServicesPageEnteredEvent>((event, emit) => _onAllServicesPageEnteredEvent(event, emit));
    on<SearchTextChangedEvent>((event, emit) => _onSearchTextChangedEvent(event, emit));
  }

  _onAllServicesPageEnteredEvent(
      AllServicesPageEnteredEvent event,
      Emitter<AllJobsPageState> emit
      )async{
    emit(GetIndustriesState()..dataState = DataState.loading);
    try{
      PaginatedIndustryEntity paginatedIndustryEntity = await getIndustriesUseCase.call(
          params: GetIndustriesUseCaseParams());
      paginatedIndustries = paginatedIndustryEntity;

      emit(GetIndustriesState(paginatedIndustries: paginatedIndustryEntity)..dataState = DataState.success);
    }catch(ex){
      emit(GetIndustriesState()..dataState = DataState.error);
    }
  }

  _onSearchTextChangedEvent(
      SearchTextChangedEvent event,
      Emitter<AllJobsPageState> emit
      )async{
    emit(SearchTextChangedState()..dataState = DataState.loading);
    try{
      PaginatedIndustryEntity paginatedIndustryEntity = await getIndustriesUseCase.call(
          params: GetIndustriesUseCaseParams(searchText: event.searchText));
      paginatedIndustries = paginatedIndustryEntity;
      emit(SearchTextChangedState()..dataState = DataState.success);
    }catch(ex){
      emit(SearchTextChangedState()..dataState = DataState.error);
    }
  }
}
