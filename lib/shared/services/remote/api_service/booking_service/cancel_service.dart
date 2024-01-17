import 'package:pickme/features/cancel_booking/domain/entites/cancel_entity.dart';
import 'package:pickme/shared/remote/PickMeApiCore.dart';

abstract class CancelService extends PickMeCoreApi{

  Future<bool> cancelBookingClicked({required CancelEntity cancelEntity});
}