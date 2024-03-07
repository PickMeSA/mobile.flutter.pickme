import 'package:dio/dio.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/add_skills/domain/entities/skills_page_entity.dart';

import 'package:pickme/features/bank_details/domain/entities/bank_details_entities.dart';
import 'package:pickme/features/final_details/data/response_models/submit_final_details_model_response/submit_final_details_model_response.dart';
import 'package:pickme/features/final_details/domain/entities/final_details_entity.dart';
import 'package:pickme/features/otp/data/response_models/otp_model_response/location_model_response.dart';
import 'package:pickme/features/otp/data/response_models/otp_model_response/payment_details_model_response.dart';
import 'package:pickme/features/otp/data/response_models/otp_model_response/work_times_model_response.dart';
import 'package:pickme/features/qualification/domain/entities/submit_qualification_and_experience_entity.dart';
import 'package:pickme/features/rate_and_work_times/domain/entities/rates_and_work_times_entity.dart';

import 'package:pickme/features/setup_profile/data/response_models/setup_profile_model_response/setup-profile_remote-submit_profile_type_model_response.dart';
import 'package:pickme/features/setup_profile/domain/entities/profile_type_entity.dart';
import 'package:pickme/shared/domain/entities/industry_entity.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_business_model_response.dart';
import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_full_profile_model_response.dart';
import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_industry_model_model_response.dart';
import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_location_model_response_model_response.dart';
import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_payment_details_model_response.dart';
import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_skill_id_model_response.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_business_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_location_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_payment_details_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_qualification_list_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_skill_ids_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_work_experience_list_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/features/upload_file/data/models/upload_file_response/upload_file_response.dart';
import 'package:pickme/shared/features/upload_file/domain/entities/uploaded_file_entity.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/remote/api-service.dart';
import 'package:pickme/shared/services/local/Hive/profile_local_storage/profile/profile_model.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';
import 'package:pickme/shared/services/remote/api_service/profile_service/profile_service.dart';

import '../../../../../features/qualification/data/response_models/qualification_model_response/submit_remote_qualification_and_experience_model_response.dart';
import '../../../../../features/rate_and_work_times/data/response_models/rate_and_work_times_model_response/submit_remote_rate_and_work_times_model_response.dart';

@Singleton(as: ProfileService)

class ProfileServiceImpl extends ProfileService{

  final ApiService apiService;

  ProfileServiceImpl({required this.apiService});
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
  Future<ProfileEntity> getRemoteProfileData({String? userId}) async{
    try {
      await initialiseAPIURLs();
      Response<dynamic> response;
      if (userId == null) {
        UserModel userModel = boxUser.get(current);
        response =
        await apiService.get("$baseUrl$version/profiles/${userModel.id}");
      } else {
        response = await apiService.get("$baseUrl$version/profiles/$userId");
      }


      return returnProfileEntity(response: response);
    } on DioException catch(ex) {
      if (ex.response!.data!["message"].toString() == "You don't have a profile and we could not create one.") {
        return ProfileEntity();
      } else {
        throw(ex.response!.data["message"].toString());
      }
    }catch(ex){
      rethrow;
    }
  }

  @override
  Future<ProfileEntity> submitWorkQualificationAndWorkExperience({required SubmitQualificationAndExperienceEntity submitQualificationAndExperienceEntity}) async {
    try{
      UserModel userModel = boxUser.get(current);
      print(SubmitRemoteQualificationAndExperienceModelResponse(
          qualifications: submitQualificationAndExperienceEntity.otpQualificationEntityList.toResponseList(),
          workExperience: submitQualificationAndExperienceEntity.otpWorKExperienceEntityList.toResponseList()).toJson());
      Response<dynamic> response = await apiService.put("$baseUrl$version/profiles/${userModel.id}",

        data: SubmitRemoteQualificationAndExperienceModelResponse(
            qualifications: submitQualificationAndExperienceEntity.otpQualificationEntityList.toResponseList(),
            workExperience: submitQualificationAndExperienceEntity.otpWorKExperienceEntityList.toResponseList()).toJson());

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
          data: skillsPageEntity.skillListEntity.toResponse().toJson());

      Response<dynamic> response = await apiService.put("$baseUrl$version/profiles/${userModel.id}",
          data: skillsPageEntity.preferredIndustryEntity.toResponse().toJson());

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
          data: PaymentDetailsModelResponse(paymentDetails: OTPPaymentDetailsModelResponse(
            bankAccountHolder: bankDetailsEntity.accountHolderName,
            bankName: bankDetailsEntity.bank,
            bankAccountType: bankDetailsEntity.accountType,
            bankAccountNumber: bankDetailsEntity.accountNumber,
            bankBranchCode: bankDetailsEntity.branchCode,
            taxNumber: '',
            vatNumber: '',
          )).toJson());

      return returnProfileEntity(response: response);

    }catch(ex){
      rethrow;
    }
  }

  @override
  Future<ProfileEntity> submitFinalDetails({required FinalDetailsEntity finalDetailsEntity})async  {

    print(SubmittedFinalDetailsModelResponse(
        description: finalDetailsEntity.description,
        profilePictureId: finalDetailsEntity.profilePicture?.id,
        policeClearanceId: finalDetailsEntity.policeClearance?.id
    ).toJson());
    try{
      UserModel userModel = boxUser.get(current);
      Response<dynamic> response = await apiService.put("$baseUrl$version/profiles/${userModel.id}",
          data: {
            'description': finalDetailsEntity.description,
            'profilePictureId': finalDetailsEntity.profilePicture?.id,
            'policeClearanceId': finalDetailsEntity.policeClearance?.id
          });

      return returnProfileEntity(response: response);

    }catch(ex){
      rethrow;
    }
  }

  returnProfileEntity({required Response<dynamic> response}){
    OTPFullProfileModelResponse otpFullProfileModelResponse = OTPFullProfileModelResponse.fromJson(response.data);
    UserModel userModel = boxUser.get(current);

    if(boxProfile.isNotEmpty) {
      ProfileModel profileModel = boxProfile.get(current);
      if(otpFullProfileModelResponse.email!.toLowerCase() == profileModel.emailAddress!.toLowerCase()) {
        boxProfile.put(current, ProfileModel(
            workPermitNumber: "",
            idNumber: otpFullProfileModelResponse.idNumber??"",
            emailAddress: otpFullProfileModelResponse.email ?? "",
            surname: otpFullProfileModelResponse.surname ?? "",
            firstName: otpFullProfileModelResponse.firstName ?? "",
            passportNumber: otpFullProfileModelResponse.passportNumber??"",
            phoneNumber: otpFullProfileModelResponse.mobile??""));
        boxUser.put(current, userModel);
        userModel.type = otpFullProfileModelResponse.type??"";
      }
      }else{
      boxProfile.put(current, ProfileModel(
          workPermitNumber: "",
          idNumber: otpFullProfileModelResponse.idNumber??"",
          emailAddress: otpFullProfileModelResponse.email ?? "",
          surname: otpFullProfileModelResponse.surname ?? "",
          firstName: otpFullProfileModelResponse.firstName ?? "",
          passportNumber: otpFullProfileModelResponse.passportNumber??"",
          phoneNumber: otpFullProfileModelResponse.mobile??""));
      boxUser.put(current, userModel);
      userModel.type = otpFullProfileModelResponse.type??"";
      }

    return ProfileEntity(
      pictureEntity: UploadedFileEntity.fromResponse(response: otpFullProfileModelResponse?.profilePicture??
          const UploadFileResponse(url: "", ref: "", id: -1)),
      subscriptionPaid: otpFullProfileModelResponse.subscriptionPaid,
      ratesAndWorkTimesEntity: RatesAndWorkTimesEntity.fromResponse(
          otpFullProfileModelResponse.hourlyRate.toString(),
          otpFullProfileModelResponse.workTimes?? WorkTimesModelResponse(startTime: "", endTime: "",
              workingDays:  otpFullProfileModelResponse.workTimes?.workingDays??[])),
      acceptedTermsAndConditions: otpFullProfileModelResponse.acceptedTermsAndConditions?? false,
      firstName: otpFullProfileModelResponse.firstName??"",
        email: otpFullProfileModelResponse.email??"",
        id: otpFullProfileModelResponse.id??0,
        passportNumber: otpFullProfileModelResponse.passportNumber??"",
        idNumber: otpFullProfileModelResponse.idNumber??"",
        surname: otpFullProfileModelResponse.surname??"",
        mobile: otpFullProfileModelResponse.mobile??"",
        workPermit: otpFullProfileModelResponse.workPermit,
        type: otpFullProfileModelResponse.type??"",
        averageRating: otpFullProfileModelResponse.averageRating==null?null:otpFullProfileModelResponse.averageRating!,
        description:  otpFullProfileModelResponse.description??"",
        business:  OTPBusinessEntity.fromResponse(otpFullProfileModelResponse.business??  OTPBusinessModelResponse(
            name: otpFullProfileModelResponse.business?.name??"",
            number: otpFullProfileModelResponse.business?.name??"",
            cipc: otpFullProfileModelResponse.business?.name??"",
            website:false)
        ),
        hourlyRate: otpFullProfileModelResponse.hourlyRate??0,
        industry: IndustryEntity.fromResponse(otpFullProfileModelResponse.industry??OTPIndustryModelModelResponse(id: 0, industry: "")),
        location: OTPLocationEntity.fromResponse(otpFullProfileModelResponse.location??const OTPLocationModelResponse(
            latitude: 0,
            longitude: 0, address: '')),
        paymentDetails: OTPPaymentDetailsEntity.fromResponse(otpFullProfileModelResponse.paymentDetails?? OTPPaymentDetailsModelResponse(
          bankAccountHolder:  otpFullProfileModelResponse.paymentDetails?.bankAccountHolder??"",
            bankName: otpFullProfileModelResponse.paymentDetails?.bankName??"",
            bankAccountType: otpFullProfileModelResponse.paymentDetails?.bankAccountType??"",
            bankAccountNumber: otpFullProfileModelResponse.paymentDetails?.bankAccountNumber??"",
            bankBranchCode: otpFullProfileModelResponse.paymentDetails?.bankBranchCode??"",
            taxNumber: otpFullProfileModelResponse.paymentDetails?.taxNumber??"",
            vatNumber: otpFullProfileModelResponse.paymentDetails?.vatNumber??"")),
        qualifications: OTPQualificationListEntity.fromResponse(otpFullProfileModelResponse.qualifications!).qualificationsEntityList??[],
        skills: OTPSkillIdsEntity.fromResponse(otpFullProfileModelResponse.skills??[]).skills,
        workExperience: OTPWorkExperienceListEntity.fromResponse(otpFullProfileModelResponse.workExperience!).workExperience??[]);
  }

  @override
  Future<ProfileEntity> submitRemoteRateAndWorkTimes({required RatesAndWorkTimesEntity ratesAndWorkTimesEntity}) async {
    try{
      UserModel userModel = boxUser.get(current);
      print(SubmitRemoteRateAndWorkTimesModelResponse(
          hourlyRate: int.parse(ratesAndWorkTimesEntity.hourlyRate!),workTimes: ratesAndWorkTimesEntity.toResponse()).toJson());

      Response<dynamic> response = await apiService.put("$baseUrl$version/profiles/${userModel.id}",
          data: SubmitRemoteRateAndWorkTimesModelResponse(
              hourlyRate: int.parse(ratesAndWorkTimesEntity.hourlyRate!),workTimes: ratesAndWorkTimesEntity.toResponse()).toJson());

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
          data: LocationModelResponse(location: otpLocationEntity.toResponse()).toJson());
      return returnProfileEntity(response: response);
    }catch(ex){
      rethrow;
    }
  }

  @override
  Future<OTPPaymentDetailsEntity> getBankDetails()async {
    try {
      UserModel userModel = boxUser.get(current);
      Response<dynamic> response = await apiService.get(
          "$baseUrl$version/profiles/${userModel.id}");
      ProfileEntity profileEntity = returnProfileEntity(response: response);
      return profileEntity.paymentDetails!;
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<ProfileEntity> submitAcceptTermsAndConditions() async{
    try {
      UserModel userModel = boxUser.get(current);
      Response<dynamic> response = await apiService.put(
          "$baseUrl$version/profiles/${userModel.id}",
          data: {
            "acceptedTermsAndConditions": true
          });
      return returnProfileEntity(response: response);
    }catch(ex){
      rethrow;
    }
  }

  @override
  Future<bool> deleteProfile() async {
   try{
     UserModel userModel = boxUser.get(current);
     Response<dynamic> response = await apiService.delete(
         "$baseUrl$version/profiles/${userModel.id}",
         data: {
           "acceptedTermsAndConditions": true
         });

     return true;
   }catch(ex){
     rethrow;
   }
  }



}

