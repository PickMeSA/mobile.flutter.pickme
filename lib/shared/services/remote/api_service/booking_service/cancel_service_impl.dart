import 'package:injectable/injectable.dart';
import 'package:pickme/features/cancel_booking/domain/entites/cancel_entity.dart';
import 'package:pickme/shared/remote/api-service.dart';
import 'package:pickme/shared/services/remote/api_service/booking_service/cancel_service.dart';

@Singleton(as:CancelService)

class CancelServiceImpl extends CancelService{

  final ApiService apiService;

  CancelServiceImpl({required this.apiService});
  @override
  Future<bool> cancelBookingClicked({required CancelEntity cancelEntity}) async {
    try{
      await apiService.post("$baseUrl$version/jobs/booking/cancel",
      data: cancelEntity.toResponse().toJson());
      return true;
    }catch(ex){
      rethrow;
    }
  }

}