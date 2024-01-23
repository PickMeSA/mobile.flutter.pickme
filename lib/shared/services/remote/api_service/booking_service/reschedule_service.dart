import 'package:pickme/features/reschedule_booking/domain/entities/reschedule_entity.dart';
import 'package:pickme/shared/remote/PickMeApiCore.dart';

abstract class RescheduleService extends PickMeCoreApi{

  Future<bool> rescheduleBooking({required RescheduleEntity rescheduleEntity});
}