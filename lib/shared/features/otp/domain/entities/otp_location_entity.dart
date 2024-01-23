import 'package:equatable/equatable.dart';
import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_location_model_response_model_response.dart';

class OTPLocationEntity extends Equatable{

  double? latitude;
  double? longitude;
  String? address;

  @override
  // TODO: implement props
  List<Object?> get props => [];

  OTPLocationEntity({
    required this.address,
    required this.latitude,
    required this.longitude});

  OTPLocationEntity.fromResponse(OTPLocationModelResponse response){
  address = response.address??"";
    longitude = response.longitude??0;
    latitude = response.latitude??0;
  }

  OTPLocationModelResponse toResponse(){
    return OTPLocationModelResponse(address: address, latitude: latitude, longitude: longitude);
  }
}