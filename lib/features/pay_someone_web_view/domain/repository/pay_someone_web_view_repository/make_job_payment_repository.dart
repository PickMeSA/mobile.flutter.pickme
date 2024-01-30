import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/entities/booking_entity.dart';

abstract class MakeJobPaymentRepository  extends BaseRepository<MakeJobPaymentRepositoryParams, String>{}

class MakeJobPaymentRepositoryParams extends BaseRepositoryParams{

  BookingEntity bookingEntity;

  MakeJobPaymentRepositoryParams({required this.bookingEntity});
}
