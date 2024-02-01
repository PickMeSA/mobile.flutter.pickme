import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/location/domain/repository/location_repository/get_current_device_location_repository.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_location_entity.dart';
import 'package:pickme/shared/services/remote/api_service/places_service/places_service.dart';

@Injectable(as: GetCurrentDeviceLocationRepository)
class GetCurrentDeviceLocationRepositoryImpl extends GetCurrentDeviceLocationRepository {
  final PlacesService placesService;
  GetCurrentDeviceLocationRepositoryImpl({required this.placesService});

  @override
  Future<OTPLocationEntity> call({GetCurrentDeviceLocationRepositoryParams? params}) async {
    try{
      return placesService.getLocation();
    }catch(ex){
      rethrow;
    }
  }

}
