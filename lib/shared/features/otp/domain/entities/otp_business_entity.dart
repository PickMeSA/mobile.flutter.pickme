 import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_business_model_response.dart';

class OTPBusinessEntity{
  String? name;
  String? number;
  String? cipc;
  bool? website;

  OTPBusinessEntity({
    required this.name,
    required this.number,
    required this.cipc,
    required this.website
});

  OTPBusinessEntity.fromResponse(OTPBusinessModelResponse response){
    website = response.website??false;
    number  = response.number??"";
    name = response.name??"";
    cipc = cipc??"";

  }
}