import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/reschedule_booking/domain/repository/reschedule_booking_repository/reschedule_booking_clicked_repository.dart';
import 'package:pickme/shared/services/remote/api_service/booking_service/reschedule_service.dart';

@Injectable(as: RescheduleBookingClickedRepository)
class RescheduleBookingClickedRepositoryImpl extends RescheduleBookingClickedRepository {
    final RescheduleService rescheduleService;
  RescheduleBookingClickedRepositoryImpl({required this.rescheduleService});

  @override
  Future<bool> call({RescheduleBookingClickedRepositoryParams? params}) async{
    try{
      return await rescheduleService.rescheduleBooking(rescheduleEntity: params!.rescheduleEntity);
    }catch(ex){
      rethrow;
    }
  }

}
