import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_location_entity.dart';
import 'package:pickme/shared/services/local/GeoLocation/geo_location.dart';

@Injectable(as: GeoLocationService)
class GeoLocationServiceImpl extends GeoLocationService{
  @override
  Future<OTPLocationEntity> getCurrentPosition() async {
    try{
    bool serviceEnabled;
    LocationPermission locationPermission;

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return OTPLocationEntity(id: "0",
        latitude: position.latitude.toString(),
        longitude: position.longitude.toString());
  }catch(ex){
      return OTPLocationEntity(id: "0",
          latitude: "37.42796133580664",
          longitude: "-122.085749655962");
    }

  }

}