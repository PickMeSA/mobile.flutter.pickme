import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/jobs/hiring/create_job_listing_info/domain/entities/create_job_listing_info_page_entity.dart';
import 'package:pickme/features/jobs/hiring/create_job_listing_info/domain/entities/info_item_entity.dart';
import 'package:pickme/shared/remote/api-service.dart';

import '../../models/create_job_listing_info_model_response.dart';
import 'job_listing_info_service.dart';

@Singleton(as: JobListingsInfoService)
class JobListingsInfoServiceImpl extends JobListingsInfoService{

  final ApiService apiService;

  JobListingsInfoServiceImpl({required this.apiService});
 
  @override
  Future<CreateJobListingInfoPageEntity> getInfo() async{
    try{
      Response<dynamic> response = await apiService.get("$baseUrl$version/cms/job-listing-details");
      CreateJobListingInfoModelResponse createJobListingInfoModelResponse =
      CreateJobListingInfoModelResponse.fromJson(response.data);

      return CreateJobListingInfoPageEntity(
          description: createJobListingInfoModelResponse.description,
          information: createJobListingInfoModelResponse.information.map((e) => InfoItemEntity(title: e.title, description: e.description)).toList());

    }catch(ex){
      rethrow;
    }
  }

}