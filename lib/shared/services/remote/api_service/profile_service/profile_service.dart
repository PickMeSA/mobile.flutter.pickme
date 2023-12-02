import 'package:pickme/features/qualification/domain/entities/submit_qualification_and_experience_entity.dart';
import 'package:pickme/features/setup_profile/domain/entities/profile_type_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/remote/PickMeApiCore.dart';

abstract class ProfileService extends PickMeCoreApi{
  ProfileService({required super.tokenLocalStorage});

  Future<bool> submitProfileType(ProfileTypeEntity profileTypeEntity);

  Future<ProfileEntity> getRemoteProfileData();

  Future<ProfileEntity> submitWorkQualificationAndWorkExperience({required SubmitQualificationAndExperienceEntity submitQualificationAndExperienceEntity});



}