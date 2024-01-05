import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:intl/intl.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc
    extends BaseBloc<HomePageEvent, HomePageState> {

    DateTime currentDate = DateTime.now();
    DateTime currentDate2 = DateTime.now();
    String currentMonth = DateFormat.yMMM().format(DateTime.now());
    DateTime targetDateTime = DateTime.now();
    HomeBloc(): super(HomePageInitState()) {

        on<CalendarMonthIncrementEvent>((event, emit) => _onCalendarMonthIncrementEvent(event, emit));
        on<CalendarMonthDecrementEvent>((event, emit) => _onCalendarMonthDecrementEvent(event, emit));
        on<CalendarDateSelectedEvent>((event ,emit) => _onCalendarDateSelectedEvent(event, emit));
        on<CalendarChangedEvent>((event, emit)=> _onCalendarChangedEvent(event, emit));
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