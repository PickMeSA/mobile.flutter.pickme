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
      data: SetupProfileSubmitprofileTypeModelResponse(type: profileTypeEntity.type).toJson());
      return true;
    }catch(ex){
      rethrow;
    }
  }

}