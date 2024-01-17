import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/remote/api-service.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';
import 'package:pickme/shared/services/remote/api_service/profile_service/profile_service.dart';
import 'package:pickme/features/jobs/shared/domain/entities/my_job_listings_page_entity.dart';

import 'get_my_job_listings_service.dart';

@Singleton(as: GetMyJobListingsService)
class GetMyJobListingsServiceImpl extends GetMyJobListingsService{

  final ApiService apiService;
  final ProfileService profileService;

  GetMyJobListingsServiceImpl({required this.apiService, required this.profileService, });
 
  @override
  Future<MyJobListingsPageEntity> getMyJobListings() async{
    try{
      UserModel userModel = boxUser.get(current);
      Response<dynamic> response = await apiService.get("$baseUrl$version/jobs?creatorId=${userModel.id}");
      ProfileEntity? profileEntity;
      try{
        profileEntity = await profileService.getRemoteProfileData();
      }catch(ex){
        logger.e("Failed to convert profile");
      }
      return MyJobListingsPageEntity.fromResponse(
          listingsResponse: response.data,
        profile: profileEntity
      );
    }catch(ex){
      rethrow;
    }
  }

}