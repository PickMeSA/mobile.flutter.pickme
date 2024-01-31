import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/job_details/domain/use_cases/job_details_usecase/get_full_job_details_usecase.dart';
import 'package:pickme/features/job_details/domain/use_cases/job_details_usecase/toggle_job_status_usecase.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/domain/usecases/apply_for_job_usecase.dart';
import 'package:pickme/shared/domain/usecases/respond_to_job_interest_use_case.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';

part 'job_details_event.dart';
part 'job_details_state.dart';

@injectable
class JobDetailsBloc
    extends BaseBloc<JobDetailsPageEvent, JobDetailsPageState> {
    JobEntity? jobEntity;
    String? currentUserId;
    bool preloaderActive = false;
    bool accepted = false;
    final GetJobFullDetailsUseCase getJobFullDetailsUseCase;
    final ApplyForJobUseCase applyForJobEvent;
    RespondToJobInterestUseCase respondToJobInterestUseCase;
    ToggleJobStatusUseCase toggleJobStatusUseCase;
    JobDetailsBloc({required this.getJobFullDetailsUseCase,
        required this.respondToJobInterestUseCase,
        required this.applyForJobEvent,
        required this.toggleJobStatusUseCase}): super(JobDetailsPageInitState()) {
        on<RespondToJobInterestEvent>((event, emit) => _onRespondToJobInterestEvent(event, emit));
        on<GetFullJobDetailsEvent>((event, emit)=> _onGetFullJobDetailsEvents(event, emit));
        on<ApplyForJobEvent>((event, emit)=> _onApplyForJobEvent(event, emit));
        on<UpdateJobPublishedStatusEvent>((event, emit)=> _onUpdateJobPublishedStatusEvent(event, emit));
    }

    Future<void> _onGetFullJobDetailsEvents( GetFullJobDetailsEvent event,
        Emitter<JobDetailsPageState> emit)async{
        if(event.job!=null){
            jobEntity = event.job;
        }
        UserModel userModel = boxUser.get(current);
        currentUserId = userModel.id;
        emit(GetFullJobDetailsState()..dataState = DataState.loading);
        try {
            jobEntity = await getJobFullDetailsUseCase.call(
                params: GetJobFullDetailsUseCaseParams(jobId: event.jobId));
            emit(GetFullJobDetailsState()..dataState = DataState.success);
        }catch(ex){
            emit(GetFullJobDetailsState(error: ex.toString())..dataState = DataState.error);
        }

    }

    Future<void> _onApplyForJobEvent( ApplyForJobEvent event,
        Emitter<JobDetailsPageState> emit)async{
        emit(ApplyForJobState()..dataState = DataState.loading);
        try {
            bool result = await applyForJobEvent.call(
                params: ApplyForJobUseCaseParams(jobEntity: jobEntity!, userId: currentUserId!
                ));
            if(result){
                emit(ApplyForJobState()..dataState = DataState.success);
            }
        }catch(ex){
            emit(ApplyForJobState(error: ex.toString())..dataState = DataState.error);
        }

    }

    _onRespondToJobInterestEvent(RespondToJobInterestEvent event,
        Emitter<JobDetailsPageState> emit) async{

        emit(RespondToJobInterestState()..dataState=DataState.loading);
        try{
            accepted = event.status=="booked";
            await respondToJobInterestUseCase.call(params: RespondToJobInterestUseCaseParams(jobInterestId: jobEntity!.jobInterestId!, status: event.status));
            emit(RespondToJobInterestState()..dataState=DataState.success);
        }catch(ex){
            emit(RespondToJobInterestState(error: ex.toString())..dataState=DataState.error);
        }
    }
    _onUpdateJobPublishedStatusEvent(UpdateJobPublishedStatusEvent event,
        Emitter<JobDetailsPageState> emit) async{

        emit(UpdateJobPublishedStatusState()..dataState=DataState.loading);
        try{
            await toggleJobStatusUseCase.call(
                params: ToggleJobStatusUseCaseParams(status: jobEntity!.status=="active"?"inactive":"active", jobId: jobEntity!.id)
            );
            emit(UpdateJobPublishedStatusState()..dataState=DataState.success);
        }catch(ex){
            emit(UpdateJobPublishedStatusState(error: ex.toString())..dataState=DataState.error);
        }
    }
} 
