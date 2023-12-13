import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'my_bookings_upcoming_event.dart';
part 'my_bookings_upcoming_state.dart';

@injectable
class MyBookingsUpcomingBloc
    extends BaseBloc<MyBookingsUpcomingPageEvent, MyBookingsUpcomingPageState> {
    MyBookingsUpcomingBloc(): super(MyBookingsUpcomingPageInitState()) {}
} 
