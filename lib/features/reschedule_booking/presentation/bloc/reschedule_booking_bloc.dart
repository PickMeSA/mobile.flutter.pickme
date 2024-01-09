import 'package:flutter/material.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/reschedule_booking/domain/entities/RescheduleReasonEntity.dart';

part 'reschedule_booking_event.dart';
part 'reschedule_booking_state.dart';

@injectable
class RescheduleBookingBloc
    extends BaseBloc<RescheduleBookingPageEvent, RescheduleBookingPageState> {

    bool checked = false;

    List<DropdownMenuEntry> rescheduleBookingEntries = [
        DropdownMenuEntry(value: RescheduleReasonEntity(id: 0, reason: "Booking Conflict"), label: "Booking Conflict"),
        DropdownMenuEntry(value: RescheduleReasonEntity(id: 1, reason: "Personal Emergency"), label: "Personal Emergency"),
        DropdownMenuEntry(value: RescheduleReasonEntity(id: 2, reason: "Not feeling well"), label: "Not feeling well"),
        DropdownMenuEntry(value: RescheduleReasonEntity(id: 3, reason: "Travel Issues "), label: "Travel Issues" ),
        DropdownMenuEntry(value: RescheduleReasonEntity(id: 4, reason: "Religious purposes"), label: "Religious purposes"),
    ];

    RescheduleBookingBloc(): super(RescheduleBookingPageInitState()) {}
} 
