import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:logger/logger.dart';
import 'package:pickme/features/jobs/shared/domain/usecases/send_job_offer_use_case.dart';
import 'package:pickme/shared/domain/entities/filter_entity.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/domain/entities/candidate_profile_entity.dart';

import '../../domain/entities/my_job_listings_page_entity.dart';
import '../../domain/use_cases/get_my_job_listings_usecase.dart';
part 'job_list_page_event.dart';
part 'job_list_page_state.dart';

@injectable
class JobListBloc extends BaseBloc<JobListPageEvent, JobListPageState> {
  final GetMyJobListingsUseCase getMyJobListingsUseCase;
  final SendJobOfferUseCase sendJobOfferUseCase;
  MyJobListingsPageEntity? myJobs;
  Logger logger = Logger();
  bool preloaderActive = false;
  JobEntity? selectedJob;

  JobListBloc({required this.getMyJobListingsUseCase, required this.sendJobOfferUseCase}) : super(MyJobListingsPageInitial()) {
    on<MyJobListingsPageEnteredEvent>((event, emit) => _onSelectExistingJobPageEnteredEvent(event, emit));
    on<JobSelectedEvent>((event, emit) => _onJobSelectedEvent(event, emit));
    on<SendJobOfferClickedEvent>((event, emit) => _onSendJobOfferClickedEvent(event, emit));
    on<FilterChangedEvent>((event, emit) => _onFilterChangedEvent(event, emit));
  }

  _onJobSelectedEvent(
      JobSelectedEvent event,
      Emitter<JobListPageState> emit
      ) {
    selectedJob = event.job;
    emit(SelectedJobChangedState());
  }
  _onSendJobOfferClickedEvent(
      SendJobOfferClickedEvent event,
      Emitter<JobListPageState> emit
      ) async{
    emit(SendJobOfferClickedState()..dataState=DataState.loading);
    try{
      bool result = await sendJobOfferUseCase.call(params: SendJobOfferUseCaseParams(candidateProfileEntity: event.candidateProfileEntity, jobEntity: selectedJob!));
      if(result){
        emit(SendJobOfferClickedState()..dataState=DataState.success);
      }else{
        emit(SendJobOfferClickedState()..dataState=DataState.error);
      }
    }catch(ex){
      emit(SendJobOfferClickedState()..dataState=DataState.error);
      logger.e(ex);
    }
  }

  _onSelectExistingJobPageEnteredEvent(
      MyJobListingsPageEnteredEvent event,
      Emitter<JobListPageState> emit
      )async{
    emit(SelectExistingJobPageEnteredState()..dataState=DataState.loading);
    try{
      myJobs = await getMyJobListingsUseCase.call();
      emit(SelectExistingJobPageEnteredState()..dataState=DataState.success);
    }catch(ex){
      emit(SelectExistingJobPageEnteredState()..dataState=DataState.error);
      logger.e(ex);
    }
  }
  _onFilterChangedEvent(
      FilterChangedEvent event,
      Emitter<JobListPageState> emit
      )async{
    emit(FilterChangedState()..dataState = DataState.loading);
    try{
      // ToDo: Update to fetch jobs using filter
      // PaginatedIndustryEntity paginatedIndustryEntity = await getIndustriesUseCase.call(
      //     params: GetIndustriesUseCaseParams(filterEntity: event.filterEntity));
      // paginatedIndustries = paginatedIndustryEntity;
      emit(FilterChangedState()..dataState = DataState.success);
    }catch(ex){
      emit(FilterChangedState()..dataState = DataState.error);
    }
  }
}
