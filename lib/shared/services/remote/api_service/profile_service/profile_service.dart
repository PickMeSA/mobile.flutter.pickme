import 'package:pickme/features/add_skills/domain/entities/skills_page_entity.dart';
import 'package:pickme/features/bank_details/domain/entities/bank_details_entities.dart';
import 'package:pickme/features/qualification/domain/entities/submit_qualification_and_experience_entity.dart';
import 'package:pickme/features/rate_and_work_times/domain/entities/rates_and_work_times_entity.dart';
import 'package:pickme/features/setup_profile/domain/entities/profile_type_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_location_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_payment_details_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/remote/PickMeApiCore.dart';

import '../../../../../features/final_details/domain/models/final_details_entity.dart';

abstract class ProfileService extends PickMeCoreApi{
  ProfileService();

  Future<bool> submitProfileType(ProfileTypeEntity profileTypeEntity);

  Future<ProfileEntity> getRemoteProfileData({String? userId});

  Future<ProfileEntity> submitWorkQualificationAndWorkExperience({required SubmitQualificationAndExperienceEntity submitQualificationAndExperienceEntity});

  Future<ProfileEntity> submitRemoteSkillsAndIndustry({required SkillsPageEntity skillsPageEntity});

  Future<ProfileEntity> submitRemoteRateAndWorkTimes({required RatesAndWorkTimesEntity ratesAndWorkTimesEntity});

  Future<ProfileEntity> submitRemoteLocation({required OTPLocationEntity otpLocationEntity});

  Future<ProfileEntity> submitBankDetails({required BankDetailsEntity bankDetailsEntity});

  Future<ProfileEntity> submitFinalDetails({required FinalDetailsEntity finalDetailsEntity});

  Future<OTPPaymentDetailsEntity> getBankDetails();

  Future<ProfileEntity> submitAcceptTermsAndConditions();

  Future<bool> deleteProfile();
}