import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/entities/booking_entity.dart';

abstract class LoadBookingsUpcomingRepository  extends BaseRepository<LoadBookingsUpcomingRepositoryParams, List<BookingEntity>>{}

class LoadBookingsUpcomingRepositoryParams extends BaseRepositoryParams{}
