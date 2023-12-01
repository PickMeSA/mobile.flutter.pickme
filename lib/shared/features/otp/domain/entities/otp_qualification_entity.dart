import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_qualification_model_response_model_response.dart';

class OTPQualificationEntity{

  String? type;
  String? name;
  String? issuingOrganization;
  String? issueDate;
  List<OTPQualificationEntity>? qualifications;

  OTPQualificationEntity({
    required this.type,
  required this.name,
  required this.issueDate,
  required this.issuingOrganization});

  OTPQualificationEntity.fromResponse( OTPQualificationModelResponse response){
    type = response.type??"";
    name = response.name??"";
    issuingOrganization = response.issuingOrganization??"";
    issueDate = response.issueDate??"";
  }

  toQualificationList(List<OTPQualificationModelResponse> response){
    qualifications = [];
    response.forEach((element) {
      qualifications!.add(OTPQualificationEntity.fromResponse(element));
    });
  }
}