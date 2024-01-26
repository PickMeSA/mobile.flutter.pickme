import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:logger/logger.dart';
import 'package:pickme/shared/domain/usecases/send_job_offer_use_case.dart';
import 'package:pickme/shared/domain/entities/filter_entity.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/domain/entities/candidate_profile_entity.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';

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
  final FilterEntity filterEntity = FilterEntity();

  JobListBloc({required this.getMyJobListingsUseCase, required this.sendJobOfferUseCase}) : super(MyJobListingsPageInitial()) {
    on<MyJobListingsPageEnteredEvent>((event, emit) => _onMyJobListingsPageEnteredEvent(event, emit));
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
    preloaderActive = true;
    try{
      bool result = await sendJobOfferUseCase.call(params: SendJobOfferUseCaseParams(candidateProfileEntity: event.candidateProfileEntity, jobEntity: selectedJob!));
      if(result){
        emit(SendJobOfferClickedState()..dataState=DataState.success);
      }else{
        emit(SendJobOfferClickedState()..dataState=DataState.error);
      }
      preloaderActive = false;
    }catch(ex){
      preloaderActive = false;
      emit(SendJobOfferClickedState(error: ex.toString())..dataState=DataState.error);
      logger.e(ex);
    }
  }

  _onMyJobListingsPageEnteredEvent(
      MyJobListingsPageEnteredEvent event,
      Emitter<JobListPageState> emit
      )async{
    emit(MyJobListingsPageEnteredState()..dataState=DataState.loading);
    try{
      filterEntity.industryId = event.industryId;
      myJobs = await getMyJobListingsUseCase.call(params: GetMyJobListingsUseCaseParams(
        lat: filterEntity.lat,
        lng: filterEntity.lng,
        maxDistance: filterEntity.distance,
        maxEstimatedHours: filterEntity.estimatedHours,
        minPrice: filterEntity.priceRange?.start,
        maxPrice: filterEntity.priceRange?.end,
        customerUid: filterEntity.customerUid,
        industryId: filterEntity.industryId,
      ));
      emit(MyJobListingsPageEnteredState()..dataState=DataState.success);
    }catch(ex){
      emit(MyJobListingsPageEnteredState(error: ex.toString())..dataState=DataState.error);
      logger.e(ex);
    }
  }
  _onFilterChangedEvent(
      FilterChangedEvent event,
      Emitter<JobListPageState> emit
      )async{
    preloaderActive = true;
    emit(FilterChangedState()..dataState = DataState.loading);
    try{
      filterEntity.industryId = event.filterEntity.industryId??filterEntity.industryId;
      filterEntity.lat = event.filterEntity.lat??filterEntity.lat;
      filterEntity.lng = event.filterEntity.lng??filterEntity.lng;
      filterEntity.distance = event.filterEntity.distance??filterEntity.distance;
      filterEntity.estimatedHours = event.filterEntity.estimatedHours??filterEntity.estimatedHours;
      filterEntity.priceRange = event.filterEntity.priceRange??filterEntity.priceRange;
      filterEntity.customerUid = event.filterEntity.customerUid??filterEntity.customerUid;
      myJobs = await getMyJobListingsUseCase.call(params: GetMyJobListingsUseCaseParams(
          lat: filterEntity.lat,
          lng: filterEntity.lng,
          maxDistance: filterEntity.distance,
          maxEstimatedHours: filterEntity.estimatedHours,
          minPrice: filterEntity.priceRange?.start,
          maxPrice: filterEntity.priceRange?.end,
          customerUid: filterEntity.customerUid

      ));
      preloaderActive = false;
      emit(FilterChangedState()..dataState = DataState.success);
    }catch(ex){
      preloaderActive = false;
      emit(FilterChangedState(error: ex.toString())..dataState = DataState.error);
    }
  }
}
