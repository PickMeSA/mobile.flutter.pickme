import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/reschedule_booking/domain/entities/RescheduleReasonEntity.dart';
import 'package:pickme/features/reschedule_booking/domain/entities/reschedule_entity.dart';
import 'package:pickme/features/reschedule_booking/domain/use_cases/reschedule_booking_usecase/reschedule_booking_clicked_usecase.dart';

part 'reschedule_booking_event.dart';
part 'reschedule_booking_state.dart';

@injectable
class RescheduleBookingBloc
    extends BaseBloc<RescheduleBookingPageEvent, RescheduleBookingPageState> {


    final RescheduleBookingClickedUseCase rescheduleBookingClickedUseCase;
    bool checked = false;

    List<DropdownMenuEntry> rescheduleBookingEntries = [
        DropdownMenuEntry(value: RescheduleReasonEntity(id: 0, reason: "Booking Conflict"), label: "Booking Conflict"),
        DropdownMenuEntry(value: RescheduleReasonEntity(id: 1, reason: "Personal Emergency"), label: "Personal Emergency"),
        DropdownMenuEntry(value: RescheduleReasonEntity(id: 2, reason: "Not feeling well"), label: "Not feeling well"),
        DropdownMenuEntry(value: RescheduleReasonEntity(id: 3, reason: "Travel Issues "), label: "Travel Issues" ),
        DropdownMenuEntry(value: RescheduleReasonEntity(id: 4, reason: "Religious purposes"), label: "Religious purposes"),
    ];

    RescheduleBookingBloc(
    {required this.rescheduleBookingClickedUseCase}
        ): super(RescheduleBookingPageInitState()) {

        on<RescheduleBookingClickedEvent>((event, emit)=> _onRescheduleBookingClickedEvent(event,emit));
    }

    Future<void> _onRescheduleBookingClickedEvent(RescheduleBookingClickedEvent event,
        Emitter<RescheduleBookingPageState> emit)async{

        emit(RescheduleBookingClickedState()..dataState = DataState.loading);

        try{
            await rescheduleBookingClickedUseCase.call(params: RescheduleBookingClickedUseCaseParams(rescheduleEntity: event.rescheduleEntity));
            emit(RescheduleBookingClickedState()..dataState = DataState.success);
        }catch(ex){
            emit(RescheduleBookingClickedState(error: ex.toString())..dataState = DataState.error);
        }


    }
}


