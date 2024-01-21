
import 'package:pickme/features/rate_and_work_times/domain/entities/rates_and_work_times_entity.dart';
import 'package:pickme/shared/domain/entities/industry_entity.dart';

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
  String? workPermit;
  String? type;
  int? averageRating;
  int? hourlyRate;
  String? description;
  RatesAndWorkTimesEntity? ratesAndWorkTimesEntity;
  List<OTPSkillIdsEntity>? skills;
  IndustryEntity? industry;
  OTPLocationEntity? location;
  List<OTPQualificationEntity>? qualifications;
  List<OTPWorkExperienceEntity>? workExperience;
  OTPPaymentDetailsEntity? paymentDetails;
  OTPBusinessEntity? business;
  bool? acceptedTermsAndConditions = false;

  ProfileEntity.blank();

  ProfileEntity({
    this.acceptedTermsAndConditions,
    this.id,
    this.firstName,
    this.idNumber,
    this.surname,
    this.mobile,
    this.passportNumber,
    this.email,
    this.type,
    this.averageRating,
    this.industry,
  this.skills,
  this.paymentDetails,
  this.workExperience,
  this.description,
  this.hourlyRate,
  this.qualifications,
  this.business,
  this.location,
  this.ratesAndWorkTimesEntity,
  this.workPermit});







}