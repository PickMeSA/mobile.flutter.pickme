import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/remote/api-service.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';
import 'package:pickme/shared/services/remote/api_service/profile_service/profile_service.dart';
import 'package:pickme/shared/domain/entities/my_job_listings_page_entity.dart';

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
      Response<dynamic> response = await apiService.get("$baseUrl$version/jobs/location/filters?customerUid=${userModel.id}");
      if(response.statusCode==200){
        return MyJobListingsPageEntity.fromResponse(
            listingsResponse: response.data["data"],
        );
      }
      throw "An error occurred";
    }catch(ex){
      rethrow;
    }
  }

}