import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/job_details/domain/use_cases/job_details_usecase/get_full_job_details_usecase.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';

part 'job_details_event.dart';
part 'job_details_state.dart';

@injectable
class JobDetailsBloc
    extends BaseBloc<JobDetailsPageEvent, JobDetailsPageState> {
    JobEntity? jobEntity;

    final GetJobFullDetailsUseCase getJobFullDetailsUseCase;
    JobDetailsBloc({required this.getJobFullDetailsUseCase}): super(JobDetailsPageInitState()) {

        on<GetFullJobDetailsEvent>((event, emit)=> _onGetFullJobDetailsEvents(event, emit));
    }

    Future<void> _onGetFullJobDetailsEvents( GetFullJobDetailsEvent event,
        Emitter<JobDetailsPageState> emit)async{
        emit(GetFullJobDetailsState()..dataState = DataState.loading);
        try {
            await getJobFullDetailsUseCase.call(
                params: GetJobFullDetailsUseCaseParams(jobId: event.jobId));
        }catch(ex){

        }

    }
} 
