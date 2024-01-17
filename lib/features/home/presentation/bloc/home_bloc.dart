import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:intl/intl.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/domain/entities/lat_long_entity.dart';
import 'package:pickme/shared/domain/usecases/location/get_current_location_usecase.dart';

import '../../domain/use_cases/home_usecase/load_jobs_in_area_event_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc
    extends BaseBloc<HomePageEvent, HomePageState> {

    DateTime currentDate = DateTime.now();
    DateTime currentDate2 = DateTime.now();
    String currentMonth = DateFormat.yMMM().format(DateTime.now());
    DateTime targetDateTime = DateTime.now();
    List<JobEntity> JobsInAreaList = [];

    final GetCurrentLocationUseCase getCurrentLocationUseCase;
    final LoadJobsInAreaEventUseCase loadJobsInAreaEventUseCase;
    HomeBloc({
        required this.loadJobsInAreaEventUseCase,
        required this.getCurrentLocationUseCase}): super(HomePageInitState()) {

        on<CalendarMonthIncrementEvent>((event, emit) => _onCalendarMonthIncrementEvent(event, emit));
        on<CalendarMonthDecrementEvent>((event, emit) => _onCalendarMonthDecrementEvent(event, emit));
        on<CalendarDateSelectedEvent>((event ,emit) => _onCalendarDateSelectedEvent(event, emit));
        on<CalendarChangedEvent>((event, emit)=> _onCalendarChangedEvent(event, emit));
        on<LoadJobsInAreaEvent>((event,emit)=> _onLoadJobsInAreaEvent(event, emit));
    }

    Future<void>_onLoadJobsInAreaEvent (
        LoadJobsInAreaEvent event,
        Emitter<HomePageState> emit
        )async{
        emit(LoadJobsInAreaState()..dataState = DataState.loading);
        try{
           JobsInAreaList =  await loadJobsInAreaEventUseCase.call(
                params: LoadJobsInAreaEventUseCaseParams(
                    latLongEntity: await  getCurrentLocationUseCase.call()));

            emit(LoadJobsInAreaState()..dataState = DataState.success);
        }catch(ex){
            emit(LoadJobsInAreaState()..dataState = DataState.error);
        }


    }

    _onCalendarChangedEvent(
        CalendarChangedEvent event,
        Emitter<HomePageState> emit
        )async{
        targetDateTime = event.dateTime;
        currentMonth = DateFormat.yMMM().format(targetDateTime);

        emit(CalendarChangedState()..dataState = DataState.success);

    }

    _onCalendarDateSelectedEvent(
        CalendarDateSelectedEvent event,
        Emitter<HomePageState> emit
        )async{
        currentDate2 = event.dateTime;
        event.events.forEach((event) => print(event.title));

        emit(CalendarDateSelectedState()..dataState = DataState.success);
    }

    _onCalendarMonthDecrementEvent(
        CalendarMonthDecrementEvent event,
        Emitter<HomePageState> emit
        )async{
        targetDateTime = DateTime(
            targetDateTime.year, targetDateTime.month - 1);
        currentMonth =
            DateFormat.yMMM().format(targetDateTime);

        emit(CalendarMonthDecrementState()..dataState = DataState.success);
    }


    _onCalendarMonthIncrementEvent(
        CalendarMonthIncrementEvent event,
        Emitter<HomePageState> emit
        )async{
        targetDateTime = DateTime(
            targetDateTime.year, targetDateTime.month + 1);
        currentMonth =
            DateFormat.yMMM().format(targetDateTime);

        emit(CalendarMonthIncrementState()..dataState = DataState.success);

    }
} 
