import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_qualification_model_response_model_response.dart';

import 'otp_qualification_entity.dart';

class OTPQualificationListEntity {

  List<OTPQualificationEntity>? qualificationsEntityList;


  OTPQualificationListEntity({required this.qualificationsEntityList});

  OTPQualificationListEntity.fromResponse(List<OTPQualificationModelResponse> response){
    qualificationsEntityList = [];
    response.forEach((element) {
      qualificationsEntityList!.add(OTPQualificationEntity.fromResponse(element));
    });
  }

  List<Map<String,dynamic>>toResponseList(){
    List<Map<String, dynamic>> qualifications =  [];
    qualificationsEntityList!.forEach((element) {
      qualifications.add(OTPQualificationModelResponse(
          type: element.type,
          name: element.name,
          issuingOrganization: element.issuingOrganization,
          issueDate: element.issueDate.toString()).toJson());
    });
    return qualifications;

  }


}