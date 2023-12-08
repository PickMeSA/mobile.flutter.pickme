import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_qualification_model_response_model_response.dart';

import 'otp_qualification_entity.dart';

class OTPQualificationListEntity {

  List<OTPQualificationEntity>? qualifications;


  OTPQualificationListEntity({required this.qualifications});

  OTPQualificationListEntity.fromResponse(List<OTPQualificationModelResponse> response){
    qualifications = [];
    response.forEach((element) {
      qualifications!.add(OTPQualificationEntity.fromResponse(element));
    });
  }

  List<OTPQualificationModelResponse>toResponseList(){
    List<OTPQualificationModelResponse> otpQualificationModelResponseList =  [];
    qualifications!.forEach((element) {
      otpQualificationModelResponseList.add(OTPQualificationModelResponse(
          type: element.type,
          name: element.name,
          issuingOrganization: element.issuingOrganization,
          issueDate: element.issueDate.toString()));
    });
    return otpQualificationModelResponseList;

  }


}