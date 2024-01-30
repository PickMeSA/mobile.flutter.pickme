import 'package:pickme/features/my_bookings_upcoming/domain/entities/booking_entity.dart';
import 'package:pickme/features/reschedule_booking/domain/entities/reschedule_entity.dart';
import 'package:pickme/shared/remote/PickMeApiCore.dart';

abstract class RescheduleService extends PickMeCoreApi{

  Future<String> rescheduleBooking({required RescheduleEntity rescheduleEntity});
}