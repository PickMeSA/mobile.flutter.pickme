import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/jobs/hiring/create_job_listing_info/domain/entities/create_job_listing_info_page_entity.dart';
import 'package:pickme/features/jobs/hiring/create_job_listing_info/domain/entities/info_item_entity.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/remote/api-service.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';
import 'package:pickme/shared/services/remote/api_service/profile_service/profile_service.dart';

import '../../../../../../../shared/services/local/Hive/user_local_storage/user_local_storage.dart';
import '../../../domain/entities/my_job_listings_page_entity.dart';
import 'get_my_job_listings_service.dart';

@Singleton(as: GetMyJobListingsService)
class GetMyJobListingsServiceImpl extends GetMyJobListingsService{

  final ApiService apiService;
  final ProfileService profileService;

  GetMyJobListingsServiceImpl({required this.apiService, required this.profileService, });
 
  @override
  Future<MyJobListingsPageEntity> getMyJobListings() async{
    try{
      final UserLocalStorage userLocalStorage = locator<UserLocalStorage>();

      UserModel userModel = userLocalStorage.getUser();
      Response<dynamic> response = await apiService.get("$baseUrl$version/jobs?creatorId=${userModel.id}");
      ProfileEntity profile = await profileService.getRemoteProfileData();
      return MyJobListingsPageEntity.fromResponse(
          listingsResponse: response.data,
        profile: profile
      );
    }catch(ex){
      rethrow;
    }
  }

}