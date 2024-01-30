import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'booking_reschedule_sent_event.dart';
part 'booking_reschedule_sent_state.dart';

@injectable
class BookingRescheduleSentBloc
    extends BaseBloc<BookingRescheduleSentPageEvent, BookingRescheduleSentPageState> {
    BookingRescheduleSentBloc(): super(BookingRescheduleSentPageInitState()) {}
} 
