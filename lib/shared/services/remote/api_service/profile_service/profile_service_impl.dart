import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/setup_profile/data/response_models/setup_profile_model_response/setup-profile_remote-submit_profile_type_model_response.dart';
import 'package:pickme/features/setup_profile/domain/entities/profile_type_entity.dart';
import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_business_model_response.dart';
import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_full_profile_model_response.dart';
import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_location_model_response_model_response.dart';
import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_payment_details_model_response.dart';
import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_skill_id_model_response.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_business_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_location_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_payment_details_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_qualification_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_qualification_list_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_skill_ids_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_work_experience_list_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_work_experinence_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/remote/api-service.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';
import 'package:pickme/shared/services/remote/api_service/profile_service/profile_service.dart';

@Singleton(as: ProfileService)

class ProfileServiceImpl extends ProfileService{

  final ApiService apiService;

  ProfileServiceImpl({required this.apiService, required super.tokenLocalStorage});
  @override
  Future<bool> submitProfileType(ProfileTypeEntity profileTypeEntity) async  {
    try{

        UserModel userModel = boxUser.get(current);
      await apiService.put("$baseUrl$version/profiles/${userModel.id}",
      data: SetupProfileSubmitprofileTypeModelResponse(type: profileTypeEntity.type).toJson());
      return true;
    }catch(ex){
      rethrow;
    }
  }

  @override
  Future<ProfileEntity> getRemoteProfileData() async{
    try{
      UserModel userModel = boxUser.get(current);
      Response<dynamic> response = await apiService.get("$baseUrl$version/profiles/${userModel.id}");
      OTPFullProfileModelResponse otpFullProfileModelResponse = OTPFullProfileModelResponse.fromJson(response.data);
      return ProfileEntity(
         type: otpFullProfileModelResponse.type??"",
      description:  otpFullProfileModelResponse.description??"",
      business:  OTPBusinessEntity.fromResponse(otpFullProfileModelResponse.business?? OTPBusinessModelResponse(
          name: "",
          number: "",
          cipc: "",
          website:false)
      ),
      hourlyRate: otpFullProfileModelResponse.hourlyRate??0,
      industryId: otpFullProfileModelResponse.industryID??0,
      location: OTPLocationEntity.fromResponse(otpFullProfileModelResponse.location??OTPLocationModelResponse(
          id: "",
          latitude: "",
          longitude: "")),
      paymentDetails: OTPPaymentDetailsEntity.fromResponse(otpFullProfileModelResponse.paymentDetails??OTPPaymentDetailsModelResponse(
          bankName: "",
          bankAccountType: "",
          bankAccountNumber: "",
          bankBranchCode: "",
          taxNumber: "",
          vatNumber: "")),
      qualifications: OTPQualificationListEntity.fromResponse(otpFullProfileModelResponse.qualifications!).qualifications??[],
      skillIds: OTPSkillIdsEntity.fromResponse(otpFullProfileModelResponse.skillIds??SkillIdModelResponse(skillsId: [])),
      workExperience: OTPWorkExperienceListEntity.fromResponse(otpFullProfileModelResponse.workExperience!).workExperience??[]);
    }catch(ex){
      rethrow;
    }
  }

}