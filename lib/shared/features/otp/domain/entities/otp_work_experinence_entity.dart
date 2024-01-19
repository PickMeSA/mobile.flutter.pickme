import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_work_experience_model_response.dart';

class OTPWorkExperienceEntity {
  String? title;
  String? company;
  bool? isCurrent;
  int? industryId;
  DateTime? startDate;
  DateTime? endDate;

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
    industryId = response.industryId??7;
    endDate = DateTime.parse(response.endDate!);
    startDate = DateTime.parse(response.startDate!);
    company = response.company??"";
    isCurrent = response.isCurrent??false;
  }

  OTPWorkExperienceModelResponse toResponse(){
    return OTPWorkExperienceModelResponse(
        title: title,
        company: company,
        startDate: startDate.toString(),
        endDate: endDate.toString(),
        isCurrent: isCurrent,
        industryId: industryId);
  }
}