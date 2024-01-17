import 'package:injectable/injectable.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/entities/booking_entity.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/repository/my_bookings_upcoming_repository/load_bookings_upcoming_repository.dart';
import 'package:pickme/shared/services/remote/api_service/booking_service/booking_service.dart';

@Injectable(as: LoadBookingsUpcomingRepository)
class LoadBookingsUpcomingRepositoryImpl extends LoadBookingsUpcomingRepository {
  final BookingService bookingService;

  LoadBookingsUpcomingRepositoryImpl({required this.bookingService});

  @override
  Future<List<BookingEntity>> call({LoadBookingsUpcomingRepositoryParams? params}) async{
    try{
      return await bookingService.getRemoteBookings();
    }catch(ex){
      rethrow;
    }
  }

}
