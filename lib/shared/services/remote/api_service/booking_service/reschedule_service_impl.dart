import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/reschedule_booking/domain/entities/reschedule_entity.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/remote/api-service.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';
import 'package:pickme/shared/services/remote/api_service/booking_service/reschedule_service.dart';

@Singleton(as : RescheduleService)
class RescheduleServiceImpl extends  RescheduleService{

  final ApiService apiService;

  RescheduleServiceImpl({required this.apiService});
  @override
  Future<String> rescheduleBooking({required RescheduleEntity rescheduleEntity}) async {
    UserModel userModel = boxUser.get(current);
    rescheduleEntity!.proposerUid = userModel.id;
    print(rescheduleEntity.toResponse().toJson());
    try {
     Response response =  await apiService.put(
          "$baseUrl$version/jobs/jobInterests/${rescheduleEntity.jobInterestId}",
          data: rescheduleEntity.toResponse().toJson());
      return response.data.toString();
    }catch(ex){
      rethrow;
    }
  }

}