import 'package:pickme/shared/features/otp/domain/entities/otp_location_entity.dart';
import 'package:pickme/shared/remote/api-service.dart';

abstract class PlacesService {
  String ApiKey = "AIzaSyAw_cAyNUUBuni6xQi09gNcMFc610lfob8";

  Future<OTPLocationEntity> getPlace({required String placeId});
}