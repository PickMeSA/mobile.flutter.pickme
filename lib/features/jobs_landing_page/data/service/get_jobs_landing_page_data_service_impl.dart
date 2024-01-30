import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/jobs/hiring/my_job_listings/data/models/my_job_listings_model_response.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/domain/entities/industry_entity.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/domain/entities/job_offer_entity.dart';
import 'package:pickme/shared/domain/entities/paginated_industry_object.dart';
import 'package:pickme/shared/domain/entities/pagination_entity.dart';
import 'package:pickme/shared/models/industries/data/response_models/industries_model_response/industries_model_response.dart';
import 'package:pickme/shared/models/job_offer/job_offer_model_response.dart';
import 'package:pickme/shared/models/pagination/data/response_models/pagination_model_response/pagination_model_response.dart';
import 'package:pickme/shared/remote/api-service.dart';

import '../../domain/entities/jobs_landing_page_entity.dart';
import 'get_jobs_landing_page_data_service.dart';

@Injectable(as: GetJobsLandingPageDataService)
class GetJobsLandingPageDataServiceImpl extends GetJobsLandingPageDataService{
  final ApiService apiService;

  GetJobsLandingPageDataServiceImpl({required this.apiService });

  Future<JobsLandingPageEntity> getLandingPageData() async {
    try {
      Response<dynamic> jobsResponse = await
      apiService.get("$baseUrl$version/jobs/recommended?pageSize=3&pageNumber=1");
      if(jobsResponse.statusCode!=200){
        throw "an error occurred";
      }
        List<JobEntity> recommended = [];
        MyJobListingsModelResponse jobsResponseModel = MyJobListingsModelResponse
            .fromJson(jobsResponse.data);
        for (var value in jobsResponseModel.data) {
          recommended.add(JobEntity.fromResponse(value));
        }

      Response<dynamic> jobOffersResponse = await
      apiService.get("$baseUrl$version/jobs/jobInterests/offer");
      if(jobsResponse.statusCode!=200){
        throw "an error occurred";
      }
        List<JobOfferEntity> jobOffers = [];
        for (var value in jobOffersResponse.data as List) {
          logger.d(value);
          JobOfferModel jobsResponseModel = JobOfferModel.fromJson(value);

          jobOffers.add(JobOfferEntity.fromResponse(jobsResponseModel));
        }

        Response<dynamic> jobsNearYouResponse = await
      apiService.get("$baseUrl$version/jobs/location/filters?maxDistance=25");
      if(jobsResponse.statusCode!=200){
        throw "an error occurred";
      }
        List<JobEntity> jobsNearMe = [];
      MyJobListingsModelResponse jobsNearYouResponseModel = MyJobListingsModelResponse
          .fromJson(jobsNearYouResponse.data);
      for (var value in jobsNearYouResponseModel.data) {
        jobsNearMe.add(JobEntity.fromResponse(value));
      }


      logger.d("services fetched ${recommended.length}");

      Response<dynamic> response =
      await apiService.get("$baseUrl$version/industries");
      logger.d("services received");
      if (response.statusCode == 200) {
        List<IndustriesModelResponse> industryModelResponseList = [];
        for (var element in response.data["data"]) {
          industryModelResponseList
              .add(IndustriesModelResponse.fromJson(element));
        }
        PaginationModelResponse paginationModelResponse =
        PaginationModelResponse.fromJson(response.data["pagination"]);

        List<IndustryEntity> industryEntityList = industryModelResponseList
            .map((e) => IndustryEntity(id: e.id, industry: e.industry))
            .toList();
        PaginationEntity paginationEntity = PaginationEntity(
            pageSize: paginationModelResponse.pageSize,
            pageNumber: paginationModelResponse.pageNumber,
            total: paginationModelResponse.total,
            totalPages: paginationModelResponse.totalPages,
            nextPage: paginationModelResponse.next_page,
            prevPage: paginationModelResponse.prev_page,
            searchTerm: paginationModelResponse.searchTerm,
            lastUpdated: DateTime.now()
        );
        PaginatedIndustryEntity services = PaginatedIndustryEntity(
            pagination: paginationEntity, industries: industryEntityList);
        logger.i(services.industries.length);
        logger.d("services processed");

        return JobsLandingPageEntity(recommendedJobs: recommended, services: services, jobRequests: jobOffers, jobsNearMe: jobsNearMe);
      }
      throw "An error occurred";
    }catch (e){
      rethrow;
    }
  }
}