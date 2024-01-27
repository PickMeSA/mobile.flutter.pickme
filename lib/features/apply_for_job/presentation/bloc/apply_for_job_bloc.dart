import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';

part 'apply_for_job_event.dart';
part 'apply_for_job_state.dart';

@injectable
class ApplyForJobBloc extends BaseBloc<ApplyForJobPageEvent, ApplyForJobPageState> {
    JobEntity? job;
    ApplyForJobBloc(): super(ApplyForJobPageInitState()) {
        on<ApplyForJobPageEnteredEvent>((event, emit) => onApplyForJobPageEnteredEvent(event, emit));
    }

    onApplyForJobPageEnteredEvent(ApplyForJobPageEnteredEvent event, Emitter<ApplyForJobPageState> emit){
        job = event.jobEntity;
    }
} 
