import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_work_experience_model_response.dart';

class OTPWorkExperienceEntity {
  String? title;
  String? company;
  bool? isCurrent;
  int? industryId;
  String? startDate;
  String? endDate;

  OTPWorkExperienceEntity({
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.company,
    required this.industryId,
    required this.isCurrent
  });

  OTPWorkExperienceEntity.fromResponse(OTPWorkExperienceModelResponse response){
    title = response.title??"";
    industryId = response.industryId??0;
    endDate = response.endDate??"";
    startDate = response.startDate??"";
    company = response.company??"";
    isCurrent = response.isCurrent??false;
  }
}