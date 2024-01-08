import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:intl/intl.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/use_cases/my_bookings_upcoming_usecase/load_bookings_upcoming_usecase.dart';

part 'my_bookings_upcoming_event.dart';
part 'my_bookings_upcoming_state.dart';

@injectable
class MyBookingsUpcomingBloc
    extends BaseBloc<MyBookingsUpcomingPageEvent, MyBookingsUpcomingPageState> {

    DateTime currentDate = DateTime.now();
    DateTime currentDate2 = DateTime.now();
    String currentMonth = DateFormat.yMMM().format(DateTime.now());
    DateTime targetDateTime = DateTime.now();

    final LoadBookingsUpcomingUseCase loadBookingsUpcomingUseCase;


    MyBookingsUpcomingBloc({
        required this.loadBookingsUpcomingUseCase
    } ): super(MyBookingsUpcomingPageInitState()) {
        on<LoadBookingsUpcomingEvent>((event, emit)=> _onLoadBookingsUpcomingEvent(event,emit));
        on<CalendarMonthIncrementEvent>((event, emit) => _onCalendarMonthIncrementEvent(event, emit));
        on<CalendarMonthDecrementEvent>((event, emit) => _onCalendarMonthDecrementEvent(event, emit));
        on<CalendarDateSelectedEvent>((event ,emit) => _onCalendarDateSelectedEvent(event, emit));
        on<CalendarChangedEvent>((event, emit)=> _onCalendarChangedEvent(event, emit));
    }

    _onLoadBookingsUpcomingEvent(event,emit) async{
        emit(LoadBookingUpcomingState()..dataState = DataState.loading);
        try{
            await loadBookingsUpcomingUseCase.call();
            emit(LoadBookingUpcomingState()..dataState = DataState.success);
        }catch(ex){
            emit(LoadBookingUpcomingState()..dataState = DataState.error);
        }
    }

    _onCalendarChangedEvent(
        CalendarChangedEvent event,
        Emitter<MyBookingsUpcomingPageState> emit
        )async{
        targetDateTime = event.dateTime;
        currentMonth = DateFormat.yMMM().format(targetDateTime);

        emit(CalendarChangedState()..dataState = DataState.success);

    }

    _onCalendarDateSelectedEvent(
        CalendarDateSelectedEvent event,
        Emitter<MyBookingsUpcomingPageState> emit
        )async{
        currentDate2 = event.dateTime;
        event.events.forEach((event) => print(event.title));

        emit(CalendarDateSelectedState()..dataState = DataState.success);
    }

    _onCalendarMonthDecrementEvent(
        CalendarMonthDecrementEvent event,
        Emitter<MyBookingsUpcomingPageState> emit
        )async{
        targetDateTime = DateTime(
            targetDateTime.year, targetDateTime.month - 1);
        currentMonth =
            DateFormat.yMMM().format(targetDateTime);

        emit(CalendarMonthDecrementState()..dataState = DataState.success);
    }


    _onCalendarMonthIncrementEvent(
        CalendarMonthIncrementEvent event,
        Emitter<MyBookingsUpcomingPageState> emit
        )async{
        targetDateTime = DateTime(
            targetDateTime.year, targetDateTime.month + 1);
        currentMonth =
            DateFormat.yMMM().format(targetDateTime);

        emit(CalendarMonthIncrementState()..dataState = DataState.success);

    }
} 
