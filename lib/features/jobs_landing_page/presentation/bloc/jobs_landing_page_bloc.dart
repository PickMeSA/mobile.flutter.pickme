import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/domain/entities/paginated_industry_object.dart';

import '../../../../../../shared/domain/usecases/get_paginated_candidates_usecase.dart';
import '../../domain/entities/jobs_landing_page_entity.dart';
import '../../domain/usecases/get_landing_page_data.dart';

part 'jobs_landing_page_event.dart';
part 'jobs_landing_page_state.dart';

@injectable
class JobsLandingPageBloc extends BaseBloc<JobsLandingPageEvent, JobsLandingPageState> {
  final GetJobLandingPageDataUseCase getJobLandingPageDataUseCase;
  JobsLandingPageEntity? pageEntity;
  final GetPaginatedCandidatesByIndustryUseCase getPaginatedCandidatesByIndustryUseCase;
  PaginatedIndustryEntity? paginatedIndustries;
  bool preloaderActive = false;
  JobsLandingPageBloc(
      {required this.getJobLandingPageDataUseCase,
      required this.getPaginatedCandidatesByIndustryUseCase}) : super(JobsLandingPageInitial()) {
    on<JobsLandingPageEnteredEvent>((event, emit) => _onJobsLandingPageEnteredEvent(event, emit));
  }
  _onJobsLandingPageEnteredEvent(
      JobsLandingPageEnteredEvent event,
      Emitter<JobsLandingPageState> emit
      ) async{
    emit(GetTopIndustriesState()..dataState = DataState.loading);
    try{
      pageEntity = await getJobLandingPageDataUseCase.call();
      logger.d(pageEntity?.recommendedJobs.length);
      emit(GetTopIndustriesState()..dataState = DataState.success);
    }catch(ex){
      logger.d(ex);
      emit(GetTopIndustriesState(error: ex.toString())..dataState = DataState.error);
    }
  }
}
