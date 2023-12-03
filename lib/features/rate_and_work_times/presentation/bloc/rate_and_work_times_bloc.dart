import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/rate_and_work_times/domain/entities/rates_and_work_times_entity.dart';
import 'package:pickme/features/rate_and_work_times/domain/entities/working_days_entity.dart';
import 'package:pickme/features/rate_and_work_times/domain/entities/working_days_list_entity.dart';
import 'package:pickme/features/rate_and_work_times/domain/use_cases/rate_and_work_times_usecase/submit_remote_rate_and_work_times_usecase.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
part 'rate_and_work_times_event.dart';
part 'rate_and_work_times_state.dart';

List<String> workingDays = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
    "Public holidays"
];

@injectable
class RateAndWorkTimesBloc
    extends BaseBloc<RateAndWorkTimesPageEvent, RateAndWorkTimesPageState> {

    final SubmitRemoteRateAndWorkTimesUseCase submitRemoteRateAndWorkTimesUseCase;
    List<WorkingDaysEntity> workingDaysEntityList = getWorkingDays();
    List<DropdownMenuEntry<WorkingDaysEntity>> workingDayEntries =[];
    List<ChipOption> chipOptions = [];
    bool checked = false;
    bool? preloaderActive = false;
    RateAndWorkTimesBloc({
        required this.submitRemoteRateAndWorkTimesUseCase
}): super(RateAndWorkTimesPageInitState()) {
        workingDayEntries = getWorkingDayEntries();
        on<FormValueChangedEvent>((event, emit)=> _onFormValueChangedEvent(event, emit));
        on<WorkingDaySelectedEvent>((event, emit) => _onWorkingDaySelectedEvent(event, emit));
        on<SkillChipDeletedEvent>((event, emit)=> _onSkillChipDeleteEvent(event, emit));
        on<SubmitRemoteRateAndWorkTimesEvent>((event, emit) => _onSubmitRemoteRateAndWorkTimesEvent(event, emit));
    }

    _onSubmitRemoteRateAndWorkTimesEvent(
        SubmitRemoteRateAndWorkTimesEvent event,
        Emitter<RateAndWorkTimesPageState> emit
        )async{
        emit(SubmitRemoteRateAndWorkTimesState()..dataState = DataState.loading);
        try{
            WorkingDaysListEntity workingDaysListEntity = WorkingDaysListEntity(workingDays: []);
                chipOptions.forEach((element) {
                    workingDaysListEntity.workingDays?.add(WorkingDaysEntity(id: element.id.toString(), day: element.label));
                });
            emit(SubmitRemoteRateAndWorkTimesState(
                profileEntity: await submitRemoteRateAndWorkTimesUseCase.call(
                params: SubmitRemoteRateAndWorkTimesUseCaseParams(
                    ratesAndWorkTimesEntity: RatesAndWorkTimesEntity(
                        hourlyRate: event.ratesAndWorkTimesEntity.hourlyRate,
                        endTime: event.ratesAndWorkTimesEntity.endTime,
                        startTime:  event.ratesAndWorkTimesEntity.startTime,
                        workingDaysListEntity: workingDaysListEntity
                    )))
            )..dataState = DataState.success  );

        }catch(ex){
            emit(SubmitRemoteRateAndWorkTimesState()..dataState = DataState.error);

        }
    }

    _onWorkingDaySelectedEvent(
        WorkingDaySelectedEvent event,
        Emitter<RateAndWorkTimesPageState> emit
        )async{
        chipOptions.add(ChipOption(label: event.workingDaysEntity.day, id: int.parse(event.workingDaysEntity.id)));
        emit(WorkingDaySelectedState());
    }

    _onFormValueChangedEvent(
        FormValueChangedEvent event,
        Emitter<RateAndWorkTimesPageState> emit
        )async{
        checked = false;
        if(
        //event.hourRateTimes.workingTimes.isNotEmpty &&
            event.hourRateTimes.hourlyRate.isNotEmpty &&
            event.hourRateTimes.startTime.isNotEmpty &&
            event.hourRateTimes.endTime.isNotEmpty &&
            chipOptions.isNotEmpty) {
            checked = true;
          emit(FormValueChangedState());
        }else{
            checked = false;
        }


    }



    List<DropdownMenuEntry<WorkingDaysEntity>> getWorkingDayEntries(){
        List<DropdownMenuEntry<WorkingDaysEntity>> workingDaysEntries = [];

        workingDaysEntityList.forEach((element) {
            workingDaysEntries.add(DropdownMenuEntry(value: element, label: element.day));
        });

        return workingDaysEntries;
    }

    _onSkillChipDeleteEvent(
        SkillChipDeletedEvent event,
        Emitter<RateAndWorkTimesPageState> emit
        )async{
        chipOptions.removeAt(event.index!);
        emit(SkillChipDeletedState()..dataState = DataState.success);
    }
}

List<WorkingDaysEntity> getWorkingDays(){
    List<WorkingDaysEntity> list = [];
    int count = 0;
    for (var element in workingDays) {
        list.add(WorkingDaysEntity(id: count.toString(), day: element));
        count = count + 1;
    }
    return list;
}


