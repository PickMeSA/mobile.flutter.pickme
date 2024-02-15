import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/apply_for_job/domain/entities/date_and_time.dart';
import 'package:pickme/features/apply_for_job/domain/use_cases/apply_for_job_usecase/update_job_date_time_usecase.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/domain/usecases/apply_for_job_usecase.dart';
import 'package:pickme/shared/domain/usecases/respond_to_job_interest_use_case.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';

part 'apply_for_job_event.dart';
part 'apply_for_job_state.dart';

@injectable
class ApplyForJobBloc extends BaseBloc<ApplyForJobPageEvent, ApplyForJobPageState> {
    JobEntity? job;
    bool preloaderActive = false;
    final UpdateJobDateTimeUseCase updateJobDateTimeUseCase;
    final RespondToJobInterestUseCase respondToJobInterestUseCase;
    final ApplyForJobUseCase applyForJobEvent;
    ApplyForJobBloc({ required this.respondToJobInterestUseCase,required this.updateJobDateTimeUseCase,
        required this.applyForJobEvent}): super(ApplyForJobPageInitState()) {
        on<ApplyForJobPageEnteredEvent>((event, emit) => onApplyForJobPageEnteredEvent(event, emit));
        on<ApplyForJobClickedEvent>((event, emit) => onApplyForJobClickedEvent(event, emit));
        on<UpdateJobDateTimeEvent>((event,emit)=> _onUpdateJobDateTimeEvent(event, emit));
        on<RespondToJobInterestEvent>((event, emit) => _onRespondToJobInterestEvent(event, emit));
    }

   Future<void> _onRespondToJobInterestEvent(
       RespondToJobInterestEvent event,
        Emitter<ApplyForJobPageState> emit) async{

        emit(RespondToJobInterestState()..dataState=DataState.loading);
        try{

            await respondToJobInterestUseCase.call(params: RespondToJobInterestUseCaseParams(jobInterestId: event.jobEntity!.jobInterestId!, status: event.status));
            emit(RespondToJobInterestState()..dataState=DataState.success);
        }catch(ex){
            emit(RespondToJobInterestState(error: ex.toString())..dataState=DataState.error);
        }
    }

    Future<void> _onUpdateJobDateTimeEvent(
        UpdateJobDateTimeEvent event,
        Emitter<ApplyForJobPageState> emit
        )async{
        try{
            emit(UpdateJobDateTimeState()..dataState = DataState.loading);
            await updateJobDateTimeUseCase.call(params: UpdateJobDateTimeUseCaseParams(jobEntity: event.jobEntity, dateAndTime:  event.dateAndTime));
            emit(UpdateJobDateTimeState()..dataState = DataState.success);
        }catch(ex){
            emit(UpdateJobDateTimeState(error: ex.toString())..dataState = DataState.error);

        }
    }

    onApplyForJobPageEnteredEvent(ApplyForJobPageEnteredEvent event, Emitter<ApplyForJobPageState> emit){
        job = event.jobEntity;
        logger.e(job);
    }

    onApplyForJobClickedEvent(ApplyForJobClickedEvent event, Emitter<ApplyForJobPageState> emit) async {
        logger.e(job);
        job = job!.copyWith(
            startDate: event.startDate,
            endDate: event.endDate,
            startTime: event.startTime,
            comments: event.comments
        );
        emit(ApplyForJobClickedState()..dataState = DataState.loading);
        try {
            UserModel userModel = boxUser.get(current);
            bool result = await applyForJobEvent.call(
                params: ApplyForJobUseCaseParams(jobEntity: job!, userId: userModel.id!
                ));
            if(result){
                emit(ApplyForJobClickedState()..dataState = DataState.success);
            }
        }catch(ex){
            emit(ApplyForJobClickedState(error: ex.toString())..dataState = DataState.error);
        }
    }
} 
