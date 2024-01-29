import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/entities/booking_entity.dart';
import 'package:pickme/features/reschedule_booking/domain/entities/reschedule_entity.dart';
import 'package:pickme/features/reschedule_booking/domain/use_cases/reschedule_booking_usecase/reschedule_booking_clicked_usecase.dart';

part 'reschedule_selection_response_event.dart';
part 'reschedule_selection_response_state.dart';

@injectable
class RescheduleSelectionResponseBloc
    extends BaseBloc<RescheduleSelectionResponsePageEvent, RescheduleSelectionResponsePageState> {
    final RescheduleBookingClickedUseCase rescheduleBookingClickedUseCase;
    RescheduleSelectionResponseBloc({
        required this.rescheduleBookingClickedUseCase
}): super(RescheduleSelectionResponsePageInitState()) {
        on<RescheduleBookingEvent>((event, emit)=> _onRescheduleBookingEvent(event, emit));
    }

    Future<void> _onRescheduleBookingEvent(
        RescheduleBookingEvent event,
        Emitter<RescheduleSelectionResponsePageState> emit
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
