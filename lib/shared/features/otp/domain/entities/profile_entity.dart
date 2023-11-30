import 'otp_business_entity.dart';
import 'otp_location_entity.dart';
import 'otp_payment_details_entity.dart';
import 'otp_qualification_entity.dart';
import 'otp_skill_ids_entity.dart';
import 'otp_work_experinence_entity.dart';

class ProfileEntity {
  String? type;
  int? hourlyRate;
  String? description;
  OTPSkillIdsEntity? skillIds;
  int? industryId;
  OTPLocationEntity? location;
  List<OTPQualificationEntity>? qualifications;
  List<OTPWorkExperienceEntity>? workExperience;
  OTPPaymentDetailsEntity? paymentDetails;
  OTPBusinessEntity? business;


}