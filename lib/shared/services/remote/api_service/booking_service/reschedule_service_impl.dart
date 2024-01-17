import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/reschedule_booking/data/response_models/reschedule_booking_model_response/reschedule_booking_model_response.dart';
import 'package:pickme/features/reschedule_booking/domain/entities/reschedule_entity.dart';
import 'package:pickme/shared/remote/api-service.dart';
import 'package:pickme/shared/services/remote/api_service/booking_service/reschedule_service.dart';

@Singleton(as : RescheduleService)
class RescheduleServiceImpl extends  RescheduleService{

  final ApiService apiService;

  RescheduleServiceImpl({required this.apiService});
  @override
  Future<bool> rescheduleBooking({required RescheduleEntity rescheduleEntity}) async {
    try {
      await apiService.post(
          "$baseUrl$version/jobs/booking/reschedule",
          data: rescheduleEntity.toResponse().toJson());
      return true;
    }catch(ex){
      rethrow;
    }
  }

}