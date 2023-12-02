import 'package:pickme/shared/features/otp/domain/entities/otp_qualification_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_qualification_list_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_work_experience_list_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_work_experinence_entity.dart';

class SubmitQualificationAndExperienceEntity {

  final OTPQualificationListEntity otpQualificationEntityList ;
  final OTPWorkExperienceListEntity otpWorKExperienceEntityList ;

  SubmitQualificationAndExperienceEntity({
    required this.otpWorKExperienceEntityList,
  required this.otpQualificationEntityList});
}