import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/entities/booking_entity.dart';
import 'package:pickme/features/reschedule_booking/domain/entities/reschedule_entity.dart';
import 'package:pickme/features/reschedule_booking/domain/use_cases/reschedule_booking_usecase/reschedule_booking_clicked_usecase.dart';

part 'propose_alternative_event.dart';
part 'propose_alternative_state.dart';

@injectable
class ProposeAlternativeBloc extends BaseBloc<ProposeAlternativePageEvent, ProposeAlternativePageState> {

    bool checked = false;
    final RescheduleBookingClickedUseCase rescheduleBookingClickedUseCase;
    ProposeAlternativeBloc({required this.rescheduleBookingClickedUseCase})
        : super(ProposeAlternativePageInitState()) {
        on<RescheduleBookingEvent>((event, emit)=> _onRescheduleBookingEvent(event, emit));
    }

    Future<void> _onRescheduleBookingEvent(
        RescheduleBookingEvent event,
        Emitter<ProposeAlternativePageState> emit
        )async{

        emit(RescheduleBookingState()..dataState = DataState.loading);
        try{


            emit(RescheduleBookingState(
                bookingEntity: await rescheduleBookingClickedUseCase.call(
                    params: RescheduleBookingClickedUseCaseParams(
                        rescheduleEntity: event.rescheduleEntity))
            )..dataState = DataState.success);
        }catch(ex){
            emit(RescheduleBookingState(error: ex.toString())..dataState = DataState.error);
        }
    }
} 
