import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/domain/entities/lat_long_entity.dart';
import 'package:pickme/shared/domain/repository/location/get_current_location_repository.dart';
import 'package:pickme/shared/services/local/geolocator_service/geolocator_service.dart';

@Injectable(as: GetCurrentLocationRepository)
class GetCurrentLocationRepositoryImpl extends GetCurrentLocationRepository {
  final GeoLocatorService geoLocatorService;
  GetCurrentLocationRepositoryImpl({required this.geoLocatorService});

  @override
  Future<LatLongEntity> call({GetCurrentLocationRepositoryParams? params})async {
    try{
      return await geoLocatorService.getCurrentLocation();
    }catch(ex){
      rethrow;
    }
  }

}
