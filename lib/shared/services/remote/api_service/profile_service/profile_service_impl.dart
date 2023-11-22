import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/register/domain/entities/user/user_model.dart';
import 'package:pickme/shared/features/otp/data/models/otp_model_response/profile_data_model_response.dart';
import 'package:pickme/shared/remote/api-service.dart';
import 'package:pickme/shared/remote/dio_api_service_impl.dart';
import 'package:pickme/shared/services/remote/api_service/profile_service/profile_service.dart';

@Singleton(as: ProfileService)
class ProfileServiceImpl extends ProfileService{

  final ApiService apiService;

  ProfileServiceImpl({required this.apiService ,required super.tokenLocalStorage});

  
  @override
  Future<UserModel> getRemoteProfileData() {
    // TODO: implement getRemoteProfileData
    throw UnimplementedError();
  }

  @override
  Future<bool> saveRemoteProfileData({required UserModel userModel}) async {
    try {
      Response<dynamic> response = await
      apiService.post("$baseUrl/api/$version/users",
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
      if(response.statusCode == 200) {
        return true;
      }
      return false;
    }catch(ex){
      rethrow;
    }

  }




}