import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/job_details/domain/use_cases/job_details_usecase/get_full_job_details_usecase.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
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
    final GetJobFullDetailsUseCase getJobFullDetailsUseCase;
    JobDetailsBloc({required this.getJobFullDetailsUseCase}): super(JobDetailsPageInitState()) {

        on<GetFullJobDetailsEvent>((event, emit)=> _onGetFullJobDetailsEvents(event, emit));
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
} 
