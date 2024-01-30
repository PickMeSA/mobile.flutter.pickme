import 'package:pickme/features/my_bookings_upcoming/domain/entities/booking_entity.dart';
import 'package:pickme/shared/remote/PickMeApiCore.dart';

abstract class PaySomeoneService extends PickMeCoreApi{

  Future<String> makePayment ();

  Future<String> makeJobPayment({required BookingEntity bookingEntity});
}