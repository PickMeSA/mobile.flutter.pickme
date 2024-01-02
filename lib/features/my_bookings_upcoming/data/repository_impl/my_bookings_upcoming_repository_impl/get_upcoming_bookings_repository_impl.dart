import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/entities/booking_entity.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/repository/my_bookings_upcoming_repository/get_upcoming_bookings_repository.dart';
import 'package:pickme/shared/services/remote/api_service/booking_service/booking_service.dart';

@Injectable(as: GetUpComingBookingsRepository)
class GetUpComingBookingsRepositoryImpl extends GetUpComingBookingsRepository {
  final BookingService bookingService;
  GetUpComingBookingsRepositoryImpl({required this.bookingService});

  @override
  Future<List<BookingEntity>> call({GetUpComingBookingsRepositoryParams? params})async {
   try{
     return await bookingService.getRemoteBookings();
   }catch(ex){
     rethrow;
   }
  }

}
