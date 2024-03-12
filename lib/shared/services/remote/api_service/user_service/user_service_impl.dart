import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/register/domain/entities/user/user_model.dart';
import 'package:pickme/shared/features/otp/data/models/otp_model_response/profile_data_model_response.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/remote/api-service.dart';
import 'package:pickme/shared/services/local/Hive/profile_local_storage/profile/profile_model.dart';
import 'package:pickme/shared/services/local/Hive/profile_local_storage/profile_local_storage.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';
import 'package:pickme/shared/services/remote/api_service/user_service/user_service.dart';

import '../../../local/Hive/user_local_storage/user_local_storage.dart';

@Singleton(as: UserService)
class UserServiceImpl extends UserService{

  final ApiService apiService;

  UserServiceImpl({required this.apiService });

  
  @override
  Future<UserEntity> getRemoteProfileData() {
    // TODO: implement getRemoteProfileData
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> saveRemoteProfileData({required UserEntity userModel}) async {

      Response<dynamic> response;

      try {
       response = await
        apiService.post("$baseUrl$version/users",
            data: ProfileDataModelResponse(
                email: userModel.email,
                id: userModel.idNumber,
                idNumber: userModel.idNumber ?? "not used",
                surname: userModel.surname,
                firstName: userModel.firstName,
                mobile: userModel.mobile,
                passportNumber: userModel.passportNumber ?? "not used",
                profileType: userModel.profileType,
                subscriptionType: userModel.subscriptionType,
                workPermitNumber: userModel.workPermitNumber ?? "not used",
                isActive: false));


        ProfileDataModelResponse profileDataModelResponse = ProfileDataModelResponse.fromJson(response.data);

      UserEntity newUserModel = UserEntity(
          email: profileDataModelResponse.email??"",
          surname: profileDataModelResponse.surname??"",
          firstName: profileDataModelResponse.firstName??"",
          mobile: profileDataModelResponse.mobile??"",
          id: profileDataModelResponse.id,
          idNumber: profileDataModelResponse.idNumber??"",
          passportNumber: profileDataModelResponse.passportNumber??"",
          workPermitNumber: profileDataModelResponse.workPermitNumber??"",
          profileType: profileDataModelResponse.profileType??"",
          subscriptionType: profileDataModelResponse.subscriptionType??""
      );
       ProfileLocalStorage profileLocalStorage = locator<ProfileLocalStorage>();
       UserLocalStorage userLocalStorage = locator<UserLocalStorage>();
       userLocalStorage.setUser(UserModel(id: profileDataModelResponse.id));
       profileLocalStorage.setProfileDetails(profileModel: ProfileModel(
          workPermitNumber: profileDataModelResponse.workPermitNumber,
          idNumber: profileDataModelResponse.idNumber,
          emailAddress: profileDataModelResponse.email,
          phoneNumber: profileDataModelResponse.mobile,
          surname: profileDataModelResponse.surname,
          firstName: profileDataModelResponse.firstName,
          passportNumber: profileDataModelResponse.passportNumber));
      return newUserModel;
    }on  DioException catch (ex){
        throw(ex.response.toString());

    }

  }

  @override
  Future<UserEntity> updateRemoteProfileDate({required UserEntity userModel})async{
    try {
      UserLocalStorage userLocalStorage = locator<UserLocalStorage>();
      UserModel userBoxModel = userLocalStorage.getUser();
      print(ProfileDataModelResponse(
          email: userModel.email,
          id: userModel.idNumber,
          idNumber: userModel.idNumber ?? "not used",
          surname: userModel.surname,
          firstName: userModel.firstName,
          mobile: userModel.mobile,
          passportNumber: userModel.passportNumber ?? "not used",
          profileType: userModel.profileType,
          subscriptionType: userModel.subscriptionType,
          workPermitNumber: userModel.workPermitNumber ?? "not used",
          isActive: false).toJson());


      Response <dynamic> response = await
      apiService.put("$baseUrl$version/users/${userBoxModel.id}",
          data: ProfileDataModelResponse(
              email: userModel.email,
              id: userModel.idNumber,
              idNumber: userModel.idNumber ?? "not used",
              surname: userModel.surname,
              firstName: userModel.firstName,
              mobile: userModel.mobile,
              passportNumber: userModel.passportNumber ?? "not used",
              profileType: userModel.profileType,
              subscriptionType: userModel.subscriptionType,
              workPermitNumber: userModel.workPermitNumber ?? "not used",
              isActive: false).toJson());
      ProfileDataModelResponse profileDataModelResponse = ProfileDataModelResponse.fromJson(response.data);

      UserEntity newUserModel = UserEntity(
          email: profileDataModelResponse.email??"",
          surname: profileDataModelResponse.surname??"",
          firstName: profileDataModelResponse.firstName??"",
          mobile: profileDataModelResponse.mobile??"",
          id: profileDataModelResponse.id,
          idNumber: profileDataModelResponse.idNumber??"|",
          passportNumber: profileDataModelResponse.passportNumber??"",
          workPermitNumber: profileDataModelResponse.workPermitNumber??"",
          profileType: profileDataModelResponse.profileType??"",
          subscriptionType: profileDataModelResponse.subscriptionType??""
      );
      userLocalStorage.setUser(UserModel(id: profileDataModelResponse.id));
      return newUserModel;
    }catch(ex){
rethrow;    }
  }




}