
import 'otp_business_entity.dart';
import 'otp_location_entity.dart';
import 'otp_payment_details_entity.dart';
import 'otp_qualification_entity.dart';
import 'otp_skill_ids_entity.dart';
import 'otp_work_experinence_entity.dart';

class ProfileEntity {
  int? id;
  String? firstName;
  String? surname;
  String? email;
  String? mobile;
  String? idNumber;
  String? passportNumber;
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

  ProfileEntity({
    this.id,
    this.firstName,
    this.idNumber,
    this.surname, this.mobile,
    this.passportNumber,
    this.email,
    this.type,
    this.industryId,
  this.skillIds,
  this.paymentDetails,
  this.workExperience,
  this.description,
  this.hourlyRate,
  this.qualifications,
  this.business,
  this.location});




}