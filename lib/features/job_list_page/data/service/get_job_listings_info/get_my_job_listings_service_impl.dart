import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/remote/api-service.dart';
import 'package:pickme/shared/services/remote/api_service/profile_service/profile_service.dart';

import '../../../domain/entities/my_job_listings_page_entity.dart';
import '../../../domain/repository/get_my_job_listings_repository.dart';
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
      if(getMyJobListingsRepositoryParams.address!=null) {
        queryParams["address"] = getMyJobListingsRepositoryParams.address;
      }
      if(getMyJobListingsRepositoryParams.search!=null) {
        queryParams["search"] = getMyJobListingsRepositoryParams.search;
      }
      logger.e("converted uri $queryParams");

      Uri queryString = Uri(queryParameters: queryParams);
      Response<dynamic> response;
      if(getMyJobListingsRepositoryParams.recommended!=null && getMyJobListingsRepositoryParams.recommended!){
        response = await apiService.get("$baseUrl$version/jobs/recommended?${queryString.query}");
      }else{
        response = await apiService.get("$baseUrl$version/jobs/location/filters?${queryString.query}");
      }

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