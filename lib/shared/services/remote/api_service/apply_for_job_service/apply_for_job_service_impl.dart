import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/add_skills/domain/entities/skill_entity.dart';
import 'package:pickme/features/jobs/hiring/review_job_listing_details/data/models/create_job_listing_model_response.dart';
import 'package:pickme/features/jobs/hiring/review_job_listing_details/domain/repository/create_job_listing_repository.dart';
import 'package:pickme/shared/domain/repository/apply_for_job_repository.dart';
import 'package:pickme/shared/models/send_job_offer_model/send_job_offer_model_request.dart';
import 'package:pickme/shared/models/skills_list_model_response/skills_model_response.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/remote/api-service.dart';

import 'apply_for_job_service.dart';

@Singleton(as: ApplyForJobService)
class ApplyForJobServiceImpl extends ApplyForJobService{

  final ApiService apiService;

  ApplyForJobServiceImpl({required this.apiService});

  @override
  Future<JobEntity> createJob({required CreateJobListingRepositoryParams jobListingRepositoryParams}) async {
    try{
      Response<dynamic> response = await apiService.post("$baseUrl$version/jobs", data: CreateJobListingModelResponse(
          title: jobListingRepositoryParams.jobEntity.title,
        description: jobListingRepositoryParams.jobEntity.description,
        status: jobListingRepositoryParams.jobEntity.status,
        startDate: jobListingRepositoryParams.jobEntity.startDate!=null?jobListingRepositoryParams.jobEntity.startDate!.toIso8601String():null,
        endDate: jobListingRepositoryParams.jobEntity.endDate!=null?jobListingRepositoryParams.jobEntity.endDate!.toIso8601String():null,
        startTime: jobListingRepositoryParams.jobEntity.startTime!=null?jobListingRepositoryParams.jobEntity.startTime!:null,
        estimatedHours: double.parse(jobListingRepositoryParams.jobEntity.estimatedHours),
        distance: 0,
        lat: double.parse(jobListingRepositoryParams.jobEntity.lat!),
        lng: double.parse(jobListingRepositoryParams.jobEntity.lng!),
        images: jobListingRepositoryParams.jobEntity.images.join(","),
        skills: jobListingRepositoryParams.jobEntity.skills.map((e) => SkillsModelResponse(id: e.id, skill: e.skill)).toList(),

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
          images: createJobListingModelResponse.images??"",
          skills: createJobListingModelResponse.skills.map((e) => SkillEntity(skill: e.skill, id: e.id)).toList(),
          id: createJobListingModelResponse.id!,
          distance: createJobListingModelResponse.distance);
    }catch(ex){
      rethrow;
    }
  }

  @override
  Future<bool> applyForJob({required ApplyForJobRepositoryParams params}) async {
   try{
     Response<dynamic> response = await apiService.post("$baseUrl$version/jobs/jobInterest", data: SendJobOfferModelRequest(
       jobId: params.jobEntity.id,
       customerUid: params.jobEntity.customer!.id!,
       labourerUid: params.userId,
       startDate: params.jobEntity.startDate!.toIso8601String(),
       endDate: params.jobEntity.endDate!.toIso8601String(),
       startTime: params.jobEntity.startTime,
       estimatedHours: params.jobEntity.estimatedHours,
       comments: params.jobEntity.comments,
       type: "application",
       status: "applied",
       bookingId: null,
     ).toJson());
     if(response.statusCode==200){
       return true;
     }else{
       throw "an error occurred";
     }
   }catch(ex){
     rethrow;
   }
  }

  @override
  Future<bool> updateJobInterestStatus({required String jobInterestId, required String status}) async {
   try{
     Response<dynamic> response = await apiService.put("$baseUrl$version/jobs/jobInterests/$jobInterestId", data: {
       "status": status,
     });
     logger.d({"responsE": response.data});
     if(response.statusCode==201 || response.statusCode==200){
       return true;
     }else{
       throw "an error occurred";
     }
   }catch(ex){
     rethrow;
   }
  }

}