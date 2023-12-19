import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:intl/intl.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/entities/booking_entity.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/use_cases/my_bookings_upcoming_usecase/get_upcoming_bookings_usecase.dart';

part 'my_bookings_upcoming_event.dart';
part 'my_bookings_upcoming_state.dart';

@injectable
class MyBookingsUpcomingBloc
    extends BaseBloc<MyBookingsUpcomingPageEvent, MyBookingsUpcomingPageState> {

    DateTime currentDate = DateTime.now();
    DateTime currentDate2 = DateTime.now();
    String currentMonth = DateFormat.yMMM().format(DateTime.now());
    DateTime targetDateTime = DateTime.now();

    List<BookingEntity> upcomingBookingList = [];
    List<BookingEntity> completedBookingList = [];
    List<BookingEntity> cancelledBookingList = [];

    final GetUpComingBookingsUseCase getUpComingBookingsUseCase;
    MyBookingsUpcomingBloc({
        required this.getUpComingBookingsUseCase
}): super(MyBookingsUpcomingPageInitState()) {
        on<GetUpcomingBookingsEvent>((event,emit) => _onGetUpcomingBookingsEvent(event, emit));
        on<CalendarMonthIncrementEvent>((event, emit) => _onCalendarMonthIncrementEvent(event, emit));
        on<CalendarMonthDecrementEvent>((event, emit) => _onCalendarMonthDecrementEvent(event, emit));
        on<CalendarDateSelectedEvent>((event ,emit) => _onCalendarDateSelectedEvent(event, emit));
        on<CalendarChangedEvent>((event, emit)=> _onCalendarChangedEvent(event, emit));
    }

    _onGetUpcomingBookingsEvent(
        GetUpcomingBookingsEvent event,
        Emitter<MyBookingsUpcomingPageState> emit
        )async{
        emit(GetUpcomingBookingsState()..dataState = DataState.loading);
        try{
            List<BookingEntity> bookings = await getUpComingBookingsUseCase.call();
            bookings.forEach((element) {

            });
        }catch(ex){
            emit(GetUpcomingBookingsState()..dataState = DataState.error);
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
