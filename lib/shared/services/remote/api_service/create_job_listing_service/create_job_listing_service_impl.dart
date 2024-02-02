import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/add_skills/domain/entities/skill_entity.dart';
import 'package:pickme/features/jobs/hiring/review_job_listing_details/data/models/create_job_listing_model_response.dart';
import 'package:pickme/features/jobs/hiring/review_job_listing_details/domain/repository/create_job_listing_repository.dart';
import 'package:pickme/shared/models/skills_list_model_response/skills_model_response.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/remote/api-service.dart';
import 'package:pickme/shared/services/remote/api_service/create_job_listing_service/create_job_listing_service.dart';
@Singleton(as: CreateJobListingService)
class CreateJobListingServiceImpl extends CreateJobListingService{

  final ApiService apiService;

  CreateJobListingServiceImpl({required this.apiService});

  @override
  Future<JobEntity> createJob({required CreateJobListingRepositoryParams jobListingRepositoryParams}) async {
    try {
      logger.e({
        "title": jobListingRepositoryParams.jobEntity.title,
        "description": jobListingRepositoryParams.jobEntity.description,
        "status": jobListingRepositoryParams.jobEntity.status,
        "address": jobListingRepositoryParams.jobEntity.address,
        "startDate": jobListingRepositoryParams.jobEntity.startDate != null
            ? jobListingRepositoryParams.jobEntity.startDate!.toIso8601String()
            : null,
        "endDate": jobListingRepositoryParams.jobEntity.endDate != null
            ? jobListingRepositoryParams.jobEntity.endDate!.toIso8601String()
            : null,
        "startTime": jobListingRepositoryParams.jobEntity.startTime != null
            ? jobListingRepositoryParams.jobEntity.startTime!
            : null,
        "estimatedHours": double.parse(
            jobListingRepositoryParams.jobEntity.estimatedHours),
        "distance": 0,
        "lat": (jobListingRepositoryParams.jobEntity.lat == null || jobListingRepositoryParams.jobEntity.lat!.isEmpty) ? null : double
            .parse(jobListingRepositoryParams.jobEntity.lat!),
        "lng": jobListingRepositoryParams.jobEntity.lng == null || jobListingRepositoryParams.jobEntity.lng!.isEmpty ? null : double
            .parse(jobListingRepositoryParams.jobEntity.lng!),
        "images": jobListingRepositoryParams.jobEntity.images.join(","),
        "skills": jobListingRepositoryParams.jobEntity.skills.map((e) => e.id)
            .toList()
            .join(","),
      });
      Response<dynamic> response = await apiService.post(
          "$baseUrl$version/jobs", data: {
        "title": jobListingRepositoryParams.jobEntity.title,
        "description": jobListingRepositoryParams.jobEntity.description,
        "status": jobListingRepositoryParams.jobEntity.status,
        "address": jobListingRepositoryParams.jobEntity.address,
        "startDate": jobListingRepositoryParams.jobEntity.startDate != null
            ? jobListingRepositoryParams.jobEntity.startDate!.toIso8601String()
            : null,
        "endDate": jobListingRepositoryParams.jobEntity.endDate != null
            ? jobListingRepositoryParams.jobEntity.endDate!.toIso8601String()
            : null,
        "startTime": jobListingRepositoryParams.jobEntity.startTime != null
            ? jobListingRepositoryParams.jobEntity.startTime!
            : null,
        "estimatedHours": double.parse(
            jobListingRepositoryParams.jobEntity.estimatedHours),
        "distance": 0,
        "lat": (jobListingRepositoryParams.jobEntity.lat == null || jobListingRepositoryParams.jobEntity.lat!.isEmpty) ? null : double
            .parse(jobListingRepositoryParams.jobEntity.lat!),
        "lng": jobListingRepositoryParams.jobEntity.lng == null || jobListingRepositoryParams.jobEntity.lng!.isEmpty ? null : double
            .parse(jobListingRepositoryParams.jobEntity.lng!),
        "images": jobListingRepositoryParams.jobEntity.images.join(","),
        "skills": jobListingRepositoryParams.jobEntity.skills.map((e) => e.id)
            .toList()
            .join(","),
      });

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
          images: createJobListingModelResponse.images??"",
          skills: jobListingRepositoryParams.jobEntity.skills,
          id: createJobListingModelResponse.id!,
          distance: createJobListingModelResponse.distance);
    }catch(ex){
      logger.e(ex);
      rethrow;
    }
    // }catch(ex){
    //   rethrow;
    // }
  }

}