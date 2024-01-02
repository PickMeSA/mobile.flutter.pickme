import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/entities/booking_entity.dart';

abstract class GetUpComingBookingsRepository  extends BaseRepository<GetUpComingBookingsRepositoryParams, List<BookingEntity>>{}

class GetUpComingBookingsRepositoryParams extends BaseRepositoryParams{}
