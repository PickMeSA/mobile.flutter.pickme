import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/entities/booking_entity.dart';
import 'package:pickme/features/reschedule_booking/domain/entities/reschedule_entity.dart';

abstract class RescheduleBookingClickedRepository  extends BaseRepository<RescheduleBookingClickedRepositoryParams, BookingEntity>{}

class RescheduleBookingClickedRepositoryParams extends BaseRepositoryParams{
  final RescheduleEntity rescheduleEntity;

  RescheduleBookingClickedRepositoryParams({required this.rescheduleEntity});
}
