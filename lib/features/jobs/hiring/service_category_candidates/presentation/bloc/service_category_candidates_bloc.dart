import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:logger/logger.dart';
import 'package:pickme/shared/domain/entities/paginated_candidate_profile_entity.dart';
import 'package:pickme/shared/domain/entities/pagination_entity.dart';

import '../../../../shared/domain/usecases/get_paginated_candidates_usecase.dart';

part 'service_category_candidates_event.dart';
part 'service_category_candidates_state.dart';

@injectable
class ServiceCategoryCandidatesBloc extends BaseBloc<ServiceCategoryCandidatesEvent, ServiceCategoryCandidatesState> {

  PaginatedCandidateProfileEntity? paginatedCandidates;
  final GetPaginatedCandidatesByIndustryUseCase getPaginatedCandidatesByIndustryUseCase;

  Logger logger = Logger();
  ServiceCategoryCandidatesBloc({required this.getPaginatedCandidatesByIndustryUseCase}) : super(ServiceCategoryCandidatesInitial()) {
    on<ServiceCategoryCandidatesPageEnteredEvent>((event, emit) =>
        _onServiceCategoryCandidatesPageEnteredEvent(event, emit));
  }
  _onServiceCategoryCandidatesPageEnteredEvent(
      ServiceCategoryCandidatesPageEnteredEvent event,
      Emitter<ServiceCategoryCandidatesState> emit
      )async{
    emit(GetServiceCategoryCandidatesState()..dataState = DataState.loading);
    try{
      PaginatedCandidateProfileEntity paginatedCandidateProfileEntity = await getPaginatedCandidatesByIndustryUseCase.call(
          params: GetPaginatedCandidatesByIndustryUseCaseParams());
      paginatedCandidates = paginatedCandidateProfileEntity;
      emit(GetServiceCategoryCandidatesState(paginatedCandidates: paginatedCandidateProfileEntity)..dataState = DataState.success);
    }catch(ex){
      logger.e(ex);
      emit(GetServiceCategoryCandidatesState()..dataState = DataState.error);
    }
  }
}
