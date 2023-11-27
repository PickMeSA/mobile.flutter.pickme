import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/rate_and_work_times/domain/entities/working_days.dart';

part 'rate_and_work_times_event.dart';
part 'rate_and_work_times_state.dart';

@injectable
class RateAndWorkTimesBloc
    extends BaseBloc<RateAndWorkTimesPageEvent, RateAndWorkTimesPageState> {

    bool checked = false;
    RateAndWorkTimesBloc(): super(RateAndWorkTimesPageInitState()) {

        on<FormValueChangedEvent>((event, emit)=> _onFormValueChangedEvent(event, emit));
    }

    _onFormValueChangedEvent(
        FormValueChangedEvent event,
        Emitter<RateAndWorkTimesPageState> emit
        )async{
        checked = false;
        if(
        //event.hourRateTimes.workingTimes.isNotEmpty &&
            event.hourRateTimes.amount.isNotEmpty &&
            event.hourRateTimes.startTime.isNotEmpty &&
            event.hourRateTimes.endTime.isNotEmpty) {
            checked = true;
          emit(FormValueChangedState());
        }else{

        }


    }
} 
