import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/setup_profile/data/response_models/setup_profile_model_response/setup-profile_remote-submit_profile_type_model_response.dart';
import 'package:pickme/features/setup_profile/domain/entities/profile_type_entity.dart';
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
      data: SetupProfileSubmitprofileTypeModelResponse(type: profileTypeEntity.type));
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
      return returnProfileEntity(response: response);
    }catch(ex){
      rethrow;
    }
  }

  @override
  Future<ProfileEntity> submitWorkQualificationAndWorkExperience({required SubmitQualificationAndExperienceEntity submitQualificationAndExperienceEntity}) async {
    try{
      UserModel userModel = boxUser.get(current);
      Response<dynamic> response = await apiService.put("$baseUrl$version/profiles/${userModel.id}",
        data: SubmitRemoteQualificationAndExperienceModelResponse(
            otpQualificationResponseModelList: submitQualificationAndExperienceEntity.otpQualificationEntityList.toResponseList(),
            otpWorKExperienceResponseModelList: submitQualificationAndExperienceEntity.otpWorKExperienceEntityList.toResponseList()));

      return returnProfileEntity(response: response);

    }catch(ex){
      rethrow;
    }
  }



  @override
  Future<ProfileEntity> submitRemoteSkillsAndIndustry({required SkillsPageEntity skillsPageEntity})async  {
    try{
      UserModel userModel = boxUser.get(current);
      await apiService.put("$baseUrl$version/profiles/${userModel.id}",
          data: skillsPageEntity.skillListEntity.toResponse());

      Response<dynamic> response = await apiService.put("$baseUrl$version/profiles/${userModel.id}",
          data: skillsPageEntity.preferredIndustryEntity.toResponse());

      return returnProfileEntity(response: response);

    }catch(ex){
      rethrow;
    }
  }

  @override
  Future<ProfileEntity> submitBankDetails({required BankDetailsEntity bankDetailsEntity})async  {
    try{
      UserModel userModel = boxUser.get(current);
      Response<dynamic> response = await apiService.put("$baseUrl$version/profiles/${userModel.id}",
          data: SubmittedBankDetailsModelResponse(
              bankName: bankDetailsEntity.bank,
            bankAccountType: bankDetailsEntity.accountType,
            bankAccountNumber: bankDetailsEntity.accountNumber,
            bankBranchCode: bankDetailsEntity.branchCode,
          ).toJson());

      return returnProfileEntity(response: response);

    }catch(ex){
      rethrow;
    }
  }

  @override
  Future<ProfileEntity> submitFinalDetails({required FinalDetailsEntity finalDetailsEntity})async  {
    try{
      UserModel userModel = boxUser.get(current);
      Response<dynamic> response = await apiService.put("$baseUrl$version/profiles/${userModel.id}",
          data: SubmittedFinalDetailsModelResponse(
            description: finalDetailsEntity.description,
            profilePicture: finalDetailsEntity.profilePicture?.url??"",
            policeClearance: finalDetailsEntity.policeClearance?.url??""
          ).toJson());

      return returnProfileEntity(response: response);

    }catch(ex){
      rethrow;
    }
  }

  returnProfileEntity({required Response<dynamic> response}){
    OTPFullProfileModelResponse otpFullProfileModelResponse = OTPFullProfileModelResponse.fromJson(response.data);
    return ProfileEntity(
        type: otpFullProfileModelResponse.type??"",
        description:  otpFullProfileModelResponse.description??"",
        business:  OTPBusinessEntity.fromResponse(otpFullProfileModelResponse.business?? const OTPBusinessModelResponse(
            name: "",
            number: "",
            cipc: "",
            website:false)
        ),
        hourlyRate: otpFullProfileModelResponse.hourlyRate??0,
        industryId: otpFullProfileModelResponse.industryID??0,
        location: OTPLocationEntity.fromResponse(otpFullProfileModelResponse.location??const OTPLocationModelResponse(
            id: "",
            latitude: "",
            longitude: "")),
        paymentDetails: OTPPaymentDetailsEntity.fromResponse(otpFullProfileModelResponse.paymentDetails??const OTPPaymentDetailsModelResponse(
            bankName: "",
            bankAccountType: "",
            bankAccountNumber: "",
            bankBranchCode: "",
            taxNumber: "",
            vatNumber: "")),
        qualifications: OTPQualificationListEntity.fromResponse(otpFullProfileModelResponse.qualifications!).qualifications??[],
        skillIds: OTPSkillIdsEntity.fromResponse(otpFullProfileModelResponse.skillIds??SkillIdModelResponse(skillsId: [])),
        workExperience: OTPWorkExperienceListEntity.fromResponse(otpFullProfileModelResponse.workExperience!).workExperience??[]);
  }

  @override
  Future<ProfileEntity> submitRemoteRateAndWorkTimes({required RatesAndWorkTimesEntity ratesAndWorkTimesEntity}) async {
    try{
      UserModel userModel = boxUser.get(current);
      Response<dynamic> response = await apiService.put("$baseUrl$version/profiles/${userModel.id}",
          data: ratesAndWorkTimesEntity.toResponse());

      return returnProfileEntity(response: response);

    }catch(ex){
      rethrow;
    }
  }



  @override
  Future<ProfileEntity> getRemoteProfileData() async{
    try{
      UserModel userModel = boxUser.get(current);
      Response<dynamic> response = await apiService.get("$baseUrl$version/profiles/${userModel.id}");
      return returnProfileEntity(response: response);
    }catch(ex){
      rethrow;
    }
  }

  @override
  Future<ProfileEntity> submitWorkQualificationAndWorkExperience({required SubmitQualificationAndExperienceEntity submitQualificationAndExperienceEntity}) async {
    try{
      UserModel userModel = boxUser.get(current);
      Response<dynamic> response = await apiService.put("$baseUrl$version/profiles/${userModel.id}",
        data: SubmitRemoteQualificationAndExperienceModelResponse(
            otpQualificationResponseModelList: submitQualificationAndExperienceEntity.otpQualificationEntityList.toResponseList(),
            otpWorKExperienceResponseModelList: submitQualificationAndExperienceEntity.otpWorKExperienceEntityList.toResponseList()));

      return returnProfileEntity(response: response);

    }catch(ex){
      rethrow;
    }
  }



  @override
  Future<ProfileEntity> submitRemoteSkillsAndIndustry({required SkillsPageEntity skillsPageEntity})async  {
    try{
      UserModel userModel = boxUser.get(current);
      await apiService.put("$baseUrl$version/profiles/${userModel.id}",
          data: skillsPageEntity.skillListEntity.toResponse());

      Response<dynamic> response = await apiService.put("$baseUrl$version/profiles/${userModel.id}",
          data: skillsPageEntity.preferredIndustryEntity.toResponse());

      return returnProfileEntity(response: response);

    }catch(ex){
      rethrow;
    }
  }

  returnProfileEntity({required Response<dynamic> response}){
    OTPFullProfileModelResponse otpFullProfileModelResponse = OTPFullProfileModelResponse.fromJson(response.data);
    return ProfileEntity(
        type: otpFullProfileModelResponse.type??"",
        description:  otpFullProfileModelResponse.description??"",
        business:  OTPBusinessEntity.fromResponse(otpFullProfileModelResponse.business?? const OTPBusinessModelResponse(
            name: "",
            number: "",
            cipc: "",
            website:false)
        ),
        hourlyRate: otpFullProfileModelResponse.hourlyRate??0,
        industryId: otpFullProfileModelResponse.industryID??0,
        location: OTPLocationEntity.fromResponse(otpFullProfileModelResponse.location??const OTPLocationModelResponse(
            id: "",
            latitude: 0,
            longitude: 0)),
        paymentDetails: OTPPaymentDetailsEntity.fromResponse(otpFullProfileModelResponse.paymentDetails??const OTPPaymentDetailsModelResponse(
            bankName: "",
            bankAccountType: "",
            bankAccountNumber: "",
            bankBranchCode: "",
            taxNumber: "",
            vatNumber: "")),
        qualifications: OTPQualificationListEntity.fromResponse(otpFullProfileModelResponse.qualifications!).qualifications??[],
        skillIds: OTPSkillIdsEntity.fromResponse(otpFullProfileModelResponse.skillIds??SkillIdModelResponse(skillsId: [])),
        workExperience: OTPWorkExperienceListEntity.fromResponse(otpFullProfileModelResponse.workExperience!).workExperience??[]);
  }

  @override
  Future<ProfileEntity> submitRemoteRateAndWorkTimes({required RatesAndWorkTimesEntity ratesAndWorkTimesEntity}) async {
    try{
      UserModel userModel = boxUser.get(current);
      Response<dynamic> response = await apiService.put("$baseUrl$version/profiles/${userModel.id}",
          data: ratesAndWorkTimesEntity.toResponse());

      return returnProfileEntity(response: response);

    }catch(ex){
      rethrow;
    }
  }

  @override
  Future<ProfileEntity> submitRemoteLocation({required OTPLocationEntity otpLocationEntity}) async {
    try{
      UserModel userModel = boxUser.get(current);
      Response<dynamic> response = await apiService.put("$baseUrl$version/profiles/${userModel.id}",
          data: otpLocationEntity.toResponse().toJson());
      return returnProfileEntity(response: response);
    }catch(ex){
      rethrow;
    }
  }



}