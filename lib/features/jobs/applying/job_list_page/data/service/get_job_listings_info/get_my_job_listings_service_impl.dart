import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/jobs/applying/job_list_page/domain/repository/get_my_job_listings_repository.dart';
import 'package:pickme/features/jobs/hiring/create_job_listing_info/domain/entities/create_job_listing_info_page_entity.dart';
import 'package:pickme/features/jobs/hiring/create_job_listing_info/domain/entities/info_item_entity.dart';
import 'package:pickme/features/jobs/hiring/my_job_listings/data/models/my_job_listings_model_response.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/remote/api-service.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';
import 'package:pickme/shared/services/remote/api_service/profile_service/profile_service.dart';

import '../../../domain/entities/my_job_listings_page_entity.dart';
import 'get_my_job_listings_service.dart';

@Singleton(as: GetMyJobListingsService)
class GetMyJobListingsServiceImpl extends GetMyJobListingsService{

  final ApiService apiService;
  final ProfileService profileService;

  GetMyJobListingsServiceImpl({required this.apiService, required this.profileService, });
 
  @override
  Future<MyJobListingsPageEntity> getMyJobListings({required GetMyJobListingsRepositoryParams
          getMyJobListingsRepositoryParams}) async{
    try{
      Map<String, dynamic> queryParams = {};
      if(getMyJobListingsRepositoryParams.industryId!=null){
        queryParams["industryId"]= getMyJobListingsRepositoryParams.industryId.toString();
      }
      if(getMyJobListingsRepositoryParams.lat!=null){
        queryParams["lat"]= getMyJobListingsRepositoryParams.lat.toString();
      }
      if(getMyJobListingsRepositoryParams.lng!=null) {
        queryParams["lng"] = getMyJobListingsRepositoryParams.lng.toString();
      }
      if(getMyJobListingsRepositoryParams.maxDistance!=null) {
        queryParams["maxDistance"] = getMyJobListingsRepositoryParams.maxDistance.toString();
      }
      if(getMyJobListingsRepositoryParams.maxEstimatedHours!=null) {
        queryParams["maxEstimatedHours"] = getMyJobListingsRepositoryParams.maxEstimatedHours.toString();
      }
      if(getMyJobListingsRepositoryParams.minPrice!=null) {
        queryParams["minPrice"] = getMyJobListingsRepositoryParams.minPrice.toString();
      }
      if(getMyJobListingsRepositoryParams.maxPrice!=null) {
        queryParams["maxPrice"] = getMyJobListingsRepositoryParams.maxPrice.toString();
      }
      if(getMyJobListingsRepositoryParams.customerUid!=null) {
        queryParams["customerUid"] = getMyJobListingsRepositoryParams.customerUid;
      }
      logger.e("converted uri $queryParams");

      Uri queryString = Uri(queryParameters: queryParams);
      Response<dynamic> response = await apiService.get("$baseUrl$version/jobs/location/filters?${queryString.query}");

      if (response.statusCode == 200) {
        return MyJobListingsPageEntity.fromResponse(
            listingsResponse: response.data["data"],
        );
      }
      throw "an error occurred";
    }catch(ex){
      rethrow;
    }
  }

}