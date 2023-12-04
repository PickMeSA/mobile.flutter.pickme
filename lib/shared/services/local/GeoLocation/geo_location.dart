import 'package:pickme/shared/features/otp/domain/entities/otp_location_entity.dart';

abstract class GeoLocationService{

  Future<OTPLocationEntity> getCurrentPosition();
}