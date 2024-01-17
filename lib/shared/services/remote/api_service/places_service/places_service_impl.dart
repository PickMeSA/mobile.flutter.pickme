import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_location_entity.dart';
import 'package:pickme/shared/remote/api-service.dart';
import 'package:pickme/shared/services/remote/api_service/places_service/places_service.dart';

@Injectable(as: PlacesService)
class PlacesServiceImpl extends PlacesService {
  final ApiService apiService;

  PlacesServiceImpl({required this.apiService});


  @override
  Future<OTPLocationEntity> getPlace({required String placeId}) async {
    try {
      String url = "https://maps.google.com/maps/api/places/details/json?place_id=$placeId&key=$ApiKey";
      Response<dynamic> response = await apiService.get(url);
      print(response.data);
      return OTPLocationEntity(
        address: response.data.toString(),
          latitude: response.data['geometry']['location']['lat'],
          longitude: response.data['geometry']['location']['lng']);
    } catch (ex) {
      rethrow;
    }
  }
}