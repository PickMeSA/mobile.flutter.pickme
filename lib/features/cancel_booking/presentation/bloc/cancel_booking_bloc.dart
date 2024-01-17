import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/cancel_booking/domain/entites/cancel_entity.dart';
import 'package:pickme/features/cancel_booking/domain/entites/cancel_reason_entity.dart';
import 'package:pickme/features/cancel_booking/domain/use_cases/cancel_booking_usecase/cancel_booking_clicked_usecase.dart';

part 'cancel_booking_event.dart';
part 'cancel_booking_state.dart';

@injectable
class CancelBookingBloc
    extends BaseBloc<CancelBookingPageEvent, CancelBookingPageState> {

    List<DropdownMenuEntry> cancelReasonEntries = [
        DropdownMenuEntry(value: CancelReasonEntity(id: 0, reason: "Family emergency"), label: "Booking Conflict"),
        DropdownMenuEntry(value: CancelReasonEntity(id: 1, reason: "Double booked"), label: "Personal Emergency"),
        DropdownMenuEntry(value: CancelReasonEntity(id: 2, reason: "Not interested anymore"), label: "Not feeling well"),
        DropdownMenuEntry(value: CancelReasonEntity(id: 3, reason: "Unfit to complete work"), label: "Travel Issues" ),
        DropdownMenuEntry(value: CancelReasonEntity(id: 4, reason: "Travel Issues"), label: "Religious purposes"),
        DropdownMenuEntry(value: CancelReasonEntity(id: 5, reason: "Religious purposes "), label: "Religious purposes"),

    ];

    final CancelBookingClickedUseCase cancelBookingClickedUseCase;
    CancelBookingBloc({required this.cancelBookingClickedUseCase}): super(CancelBookingPageInitState()) {
        on<CancelBookingClickedEvent>((event, emit)=> _onCancelBookingClickedEvent(event, emit));
    }

    Future<void> _onCancelBookingClickedEvent(CancelBookingClickedEvent event,
        Emitter<CancelBookingPageState> emit) async{
        try{
            emit(CancelBookingClickedState()..dataState = DataState.loading);
            await cancelBookingClickedUseCase.call(params: CancelBookingClickedUseCaseParams(cancelEntity:event.cancelEntity));
            emit(CancelBookingClickedState()..dataState = DataState.success);
        }catch(ex){
            emit(CancelBookingClickedState(error: ex.toString())..dataState = DataState.error);
        }
    }



} 
