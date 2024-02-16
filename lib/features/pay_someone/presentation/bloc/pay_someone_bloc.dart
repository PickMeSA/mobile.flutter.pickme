import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/entities/booking_entity.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/use_cases/my_bookings_upcoming_usecase/load_bookings_upcoming_usecase.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';

part 'pay_someone_event.dart';
part 'pay_someone_state.dart';

@injectable
class PaySomeoneBloc
    extends BaseBloc<PaySomeonePageEvent, PaySomeonePageState> {

    List<BookingEntity> upcomingHireBookingsList = [];

    final LoadBookingsUpcomingUseCase loadBookingsUpcomingUseCase;
    PaySomeoneBloc({
        required this.loadBookingsUpcomingUseCase
}): super(PaySomeonePageInitState()) {

        on<LoadBookingsUpcomingEvent>((event, emit)=> _onLoadBookingsUpcomingEvent(event,emit));
    }

    _onLoadBookingsUpcomingEvent(event,emit) async{
        emit(LoadBookingUpcomingState()..dataState = DataState.loading);
        UserModel userModel = boxUser.get(current);
        upcomingHireBookingsList.clear();
        try{
            await loadBookingsUpcomingUseCase.call()
                .then((profileBookings){
                profileBookings.forEach((element) {
                    switch(element.status){
                        case JobStatus.cancelled:
                        case JobStatus.completed:
                        break;
                        default: if(element.customerUid == userModel.id) upcomingHireBookingsList.add(element);
                    }
                });
            });
            emit(LoadBookingUpcomingState()..dataState = DataState.success);
        }catch(ex){
            emit(LoadBookingUpcomingState(error: ex.toString())..dataState = DataState.error);
        }
    }
} 
