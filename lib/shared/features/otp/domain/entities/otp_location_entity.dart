import 'package:equatable/equatable.dart';
import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_location_model_response_model_response.dart';

class OTPLocationEntity extends Equatable{
  String? id;
  String? latitude;
  String? longitude;

  @override
  // TODO: implement props
  List<Object?> get props => [id];

  OTPLocationEntity({
    required this.id,
    required this.latitude,
    required this.longitude});

  OTPLocationEntity.fromResponse(OTPLocationModelResponse response){
    id = response.id??"";
    longitude = response.longitude??"";
    latitude = response.latitude??"";
  }
}