import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/shared/classes/debouncer.dart';
import 'package:pickme/shared/domain/entities/filter_entity.dart';
import 'package:pickme/shared/domain/entities/paginated_industry_object.dart';

import '../../../../../../shared/domain/usecases/get_industries_usecase.dart';
import '../../../../../../shared/domain/usecases/get_paginated_candidates_usecase.dart';

part 'all_services_page_event.dart';
part 'all_services_page_state.dart';

@injectable
class AllServicesPageBloc extends BaseBloc<AllServicesPageEvent, AllServicesPageState> {

  final GetIndustriesUseCase getIndustriesUseCase;
  final GetPaginatedCandidatesByIndustryUseCase getPaginatedCandidatesByIndustryUseCase;
  PaginatedIndustryEntity? paginatedIndustries;
  bool preloaderActive = false;
  final Logger logger = Logger();
  FilterEntity filterEntity = FilterEntity();

  AllServicesPageBloc({
    required this.getIndustriesUseCase,
    required this.getPaginatedCandidatesByIndustryUseCase}) : super(AllServicesPageInitial()) {
    on<AllServicesPageEnteredEvent>((event, emit) => _onAllServicesPageEnteredEvent(event, emit));
    on<SearchTextChangedEvent>((event, emit) => _onSearchTextChangedEvent(event, emit));
    on<FilterChangedEvent>((event, emit) => _onFilterChangedEvent(event, emit));
  }

  _onAllServicesPageEnteredEvent(
      AllServicesPageEnteredEvent event,
      Emitter<AllServicesPageState> emit
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
      Emitter<AllServicesPageState> emit
      )async{
    emit(SubmitSearchState()..dataState = DataState.loading);
    try{
      filterEntity.title = event.searchText.isEmpty?null:event.searchText;
      filterEntity.address = event.address.isEmpty?null:event.address;
      emit(SubmitSearchState()..dataState = DataState.success);
    }catch(ex){
      emit(SubmitSearchState()..dataState = DataState.error);
    }
  }
  _onFilterChangedEvent(
      FilterChangedEvent event,
      Emitter<AllServicesPageState> emit
      )async{
    emit(SubmitSearchState()..dataState = DataState.loading);
    try{
      filterEntity = filterEntity.copyWith(
        priceRange_: event.filterEntity.priceRange,
        estimatedHours_: event.filterEntity.estimatedHours,
        rating_: event.filterEntity.rating,
        distance_: event.filterEntity.distance
      );
      emit(SubmitSearchState()..dataState = DataState.success);
    }catch(ex){
      emit(SubmitSearchState()..dataState = DataState.error);
    }
  }
}
