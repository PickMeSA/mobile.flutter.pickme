import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:intl/intl.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/job_list_page/domain/entities/my_job_listings_page_entity.dart';
import 'package:pickme/features/job_list_page/domain/use_cases/get_my_job_listings_usecase.dart';
import 'package:pickme/features/location/domain/use_cases/location_usecase/get_current_device_location_usecase.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/entities/booking_entity.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/use_cases/my_bookings_upcoming_usecase/load_bookings_upcoming_usecase.dart';
import 'package:pickme/shared/domain/entities/paginated_candidate_profile_entity.dart';
import 'package:pickme/shared/domain/entities/paginated_industry_object.dart';
import 'package:pickme/shared/domain/usecases/get_paginated_candidates_usecase.dart';
import 'package:pickme/shared/domain/usecases/location/get_current_location_usecase.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_location_entity.dart';

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

    List<BookingEntity> upcomingHireBookingsList = [];



    final GetCurrentDeviceLocationUseCase getCurrentDeviceLocationUseCase;
    final GetPaginatedCandidatesByIndustryUseCase getPaginatedCandidatesByIndustryUseCase;
    final GetCurrentLocationUseCase getCurrentLocationUseCase;
    final GetMyJobListingsUseCase getMyJobListingsUseCase;
    final LoadBookingsUpcomingUseCase loadBookingsUpcomingUseCase;

    MyJobListingsPageEntity? jobListingsPageEntity;
    int jobCount = 0;
    PaginatedCandidateProfileEntity? paginatedCandidates;

    PaginatedIndustryEntity? paginatedIndustries;
    bool preloaderActive = false;
    HomeBloc({required this.loadBookingsUpcomingUseCase,
    required this.getCurrentDeviceLocationUseCase,
        required this.getPaginatedCandidatesByIndustryUseCase,
        required this.getMyJobListingsUseCase,
        required this.getCurrentLocationUseCase}): super(HomePageInitState()) {

        on<CalendarMonthIncrementEvent>((event, emit) => _onCalendarMonthIncrementEvent(event, emit));
        on<CalendarMonthDecrementEvent>((event, emit) => _onCalendarMonthDecrementEvent(event, emit));
        on<CalendarDateSelectedEvent>((event ,emit) => _onCalendarDateSelectedEvent(event, emit));
        on<CalendarChangedEvent>((event, emit)=> _onCalendarChangedEvent(event, emit));
        on<JobsHiringLandingPageEnteredEvent>((event, emit) => _onJobsHiringLandingPageEnteredEvent(event, emit));
        on<NextAppointmentCardClickedEvent>((event,emit) => _onNextAppointmentCardClickedEvent(event,emit));
    }

    _onNextAppointmentCardClickedEvent(
        NextAppointmentCardClickedEvent event,
        Emitter<HomePageState> emit
        )async{
        emit(NextAppointmentCardClickedState()..dataState = DataState.loading);
        try{
            upcomingHireBookingsList.clear();
            try{
                await loadBookingsUpcomingUseCase.call().then((profileBookings){
                    profileBookings.forEach((element) {
                        switch(element.status){
                            case JobStatus.cancelled:
                            break;
                            case JobStatus.completed:
                            break;
                            default: upcomingHireBookingsList.add(element);
                        }
                    });
                });
                emit(NextAppointmentCardClickedState(bookingList: upcomingHireBookingsList, )..dataState = DataState.success);
            }catch(ex){
                emit(NextAppointmentCardClickedState(error: ex.toString())..dataState = DataState.error);
            }
        }catch(ex){
        }
    }

    _onJobsHiringLandingPageEnteredEvent(
        JobsHiringLandingPageEnteredEvent event,
        Emitter<HomePageState> emit
        )async{
        try{
            PaginatedCandidateProfileEntity paginatedCandidateProfileEntity = await getPaginatedCandidatesByIndustryUseCase.call(
                params: GetPaginatedCandidatesByIndustryUseCaseParams(
                    pageNumber: 1, pageSize: 5,
                ));
            paginatedCandidates = paginatedCandidateProfileEntity;
            jobListingsPageEntity = await getMyJobListingsUseCase.call(params: GetMyJobListingsUseCaseParams(
                maxDistance: 50
            ));
            jobCount = ((jobListingsPageEntity?.activeJobs.length??0) + (jobListingsPageEntity?.inactiveJobs.length??0) );
            emit(JobsHiringLandingPageEnteredState()..dataState = DataState.success);
        }catch(ex){
            emit(JobsHiringLandingPageEnteredState()..dataState = DataState.error);
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
