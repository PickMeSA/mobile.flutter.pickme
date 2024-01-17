import 'package:injectable/injectable.dart';
import 'package:pickme/shared/domain/entities/lat_long_entity.dart';
import 'package:geolocator/geolocator.dart';

import 'geolocator_service.dart';

@Singleton(as: GeoLocatorService)
class GeoLocatorServiceImpl extends GeoLocatorService{

  final GeolocatorPlatform geolocatorPlatform;

  GeoLocatorServiceImpl({required this.geolocatorPlatform});
  @override
  Future<LatLongEntity> getCurrentLocation() async {
    try{
      Position position = await geolocatorPlatform.getCurrentPosition();
      return LatLongEntity(lat: position.latitude, long: position.longitude);
    }catch(ex){
      rethrow;
    }
  }

}