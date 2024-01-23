import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/jobs/hiring/review_job_listing_details/data/models/create_job_listing_model_response.dart';
import 'package:pickme/features/jobs/hiring/review_job_listing_details/domain/repository/create_job_listing_repository.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/features/jobs/shared/service/remote/create_job_listing_service/create_job_listing_service.dart';
import 'package:pickme/shared/remote/api-service.dart';
@Singleton(as: CreateJobListingService)
class CreateJobListingServiceImpl extends CreateJobListingService{

  final ApiService apiService;

  CreateJobListingServiceImpl({required this.apiService});

  @override
  Future<JobEntity> createJob({required CreateJobListingRepositoryParams jobListingRepositoryParams}) async {
    // try{
      Response<dynamic> response = await apiService.post("$baseUrl$version/jobs", data: CreateJobListingModelResponse(
          title: jobListingRepositoryParams.jobEntity.title,
        description: jobListingRepositoryParams.jobEntity.description,
        status: jobListingRepositoryParams.jobEntity.status,
        startDate: jobListingRepositoryParams.jobEntity.startDate!=null?jobListingRepositoryParams.jobEntity.startDate!.toIso8601String():null,
        endDate: jobListingRepositoryParams.jobEntity.endDate!=null?jobListingRepositoryParams.jobEntity.endDate!.toIso8601String():null,
        startTime: jobListingRepositoryParams.jobEntity.startTime!=null?jobListingRepositoryParams.jobEntity.startTime!:null,
        estimatedHours: double.parse(jobListingRepositoryParams.jobEntity.estimatedHours),
        distance: 0,
        lat: double.parse(jobListingRepositoryParams.jobEntity.lat),
        lng: double.parse(jobListingRepositoryParams.jobEntity.lng),
        images: jobListingRepositoryParams.jobEntity.images.join(","),
        skills: jobListingRepositoryParams.jobEntity.skills.map((e) => e.label).toList().join(","),

      ).toJson());

      CreateJobListingModelResponse createJobListingModelResponse = CreateJobListingModelResponse.fromJson(response.data);
      logger.i("created job successfully");
      return JobEntity(title: createJobListingModelResponse.title,
          description: createJobListingModelResponse.description,
          status: createJobListingModelResponse.status,
          startDate: createJobListingModelResponse.startDate!=null?DateTime.parse(createJobListingModelResponse.startDate!):null,
          endDate: createJobListingModelResponse.endDate!=null?DateTime.parse(createJobListingModelResponse.endDate!):null,
          startTime: createJobListingModelResponse.startTime,
          estimatedHours: double.parse(createJobListingModelResponse.estimatedHours.toString()),
          lat: createJobListingModelResponse.lat,
          lng: createJobListingModelResponse.lng,
          images: createJobListingModelResponse.images,
          skills: createJobListingModelResponse.skills,
          id: createJobListingModelResponse.id!,
          distance: createJobListingModelResponse.distance);
    // }catch(ex){
    //   rethrow;
    // }
  }

}