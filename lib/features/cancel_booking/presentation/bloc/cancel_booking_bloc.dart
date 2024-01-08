import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'cancel_booking_event.dart';
part 'cancel_booking_state.dart';

@injectable
class CancelBookingBloc
    extends BaseBloc<CancelBookingPageEvent, CancelBookingPageState> {
    CancelBookingBloc(): super(CancelBookingPageInitState()) {}
} 
