import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_work_experience_model_response.dart';

import 'otp_work_experinence_entity.dart';

class OTPWorkExperienceListEntity{

  List<OTPWorkExperienceEntity>? workExperience;

  OTPWorkExperienceListEntity({required this.workExperience});


  OTPWorkExperienceListEntity.fromResponse(List<OTPWorkExperienceModelResponse> response){
    workExperience = [];
    response.forEach((element) {
      workExperience!.add(OTPWorkExperienceEntity.fromResponse(element));
    });
  }

  List<Map<String, dynamic>> toResponseList(){
    List<Map<String, dynamic>> otpWorkExperienceModelResponseList = [];

    workExperience!.forEach((element) {
      otpWorkExperienceModelResponseList.add(OTPWorkExperienceModelResponse(
          title: element.title,
          company: element.company,
          startDate: element.startDate.toString(),
          endDate: element.endDate.toString(),
          isCurrent: element.isCurrent,
          industryId: element.industryId,
        files: []
      ));
    });

    return otpWorkExperienceModelResponseList;
  }

}