

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/apply_for_job/data/response_models/apply_for_job_model_response/date_and_time_model_response.dart';
import 'package:pickme/features/apply_for_job/domain/entities/date_and_time.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/domain/entities/lat_long_entity.dart';
import 'package:pickme/shared/models/jobs/my_job_listings_job_model_response.dart';
import 'package:pickme/shared/models/location/location_model_response/location_model_response.dart';
import 'package:pickme/shared/remote/api-service.dart';
import 'package:pickme/shared/services/remote/api_service/jobs_service/jobs_service.dart';

@Singleton(as: JobService)
class JobServiceImplementation extends JobService{

  final ApiService apiService;

  JobServiceImplementation({required this.apiService});

  @override
  Future<JobEntity> getJobFullDetails({required String jobid}) async{
  try{
    Response<dynamic> response = await apiService.get("$baseUrl$version/jobs/$jobid");
    MyJobListingsJobModelResponse jobsModelResponse = MyJobListingsJobModelResponse.fromJson(response.data);
    return JobEntity.fromResponse(jobsModelResponse);
  }catch(ex){
    rethrow;
  }
  }

  @override
  Future<bool> removePotentialMatches({required String jobId, required String commaSeparatedIds}) async{
    try{
    Response<dynamic> response = await apiService.put("$baseUrl$version/jobs/$jobId", data: {
      "potentialMatchesRemoved": commaSeparatedIds
    });

    return response.statusCode==200 || response.statusCode==201;
  }catch(ex){
    rethrow;
  }
  }

  @override
  Future<bool> updateJobStatus({required String jobId, required String status}) async{
    try{
    Response<dynamic> response = await apiService.put("$baseUrl$version/jobs/$jobId", data: {
      "status": status
    });
    return response.statusCode==200 || response.statusCode==201;
  }catch(ex){
    rethrow;
  }
  }

  @override
  Future<List<JobEntity>> getJobsInArea({required LatLongEntity latLongEntity}) async {
    try {
      Response<dynamic> response = await apiService.get(
          "$baseUrl$version/jobs/location",
          queryParameters: LocationModelResponse(
              lat: latLongEntity.lat, lng: latLongEntity.long).toJson());
      List<dynamic> myJobListresponse = response.data;
      List<MyJobListingsJobModelResponse> myJobsList = myJobListresponse.map((
          e) =>
          MyJobListingsJobModelResponse(
              startTime: e["startTime"],
              startDate: e["startDate"],
              status: e["status"],
              id: e["id"],
              description: e["description"],
              title: e["title"],
              distance: e["distance"],
              endDate: e["endDate"],
              estimatedHours: e["estimatedHours"],
              images: e["images"],
              lat: e['let'],
              lng: e["lan"],
              skills: e["skills"]
          )).toList();

      List<JobEntity> myJobsEntityList = myJobListresponse.map((e) =>
          JobEntity(title: e.title,
              description: e.description,
              status: e.status,
              estimatedHours: e.estimatedHours,
              lat: e.lat,
              lng: e.lng,
              images: e.images,
              skills: e.skills,
              id: e.id,
              distance: e.distance)
      ).toList();

      return myJobsEntityList;
    }catch(ex){
      rethrow;
    }

  }

  Future<bool>updateJobInterestDateTime(
      {required JobEntity jobEntity, required   DateAndTime dateAndTime})async{
    try{
      Response<dynamic> response = await apiService.put(
          "$baseUrl$version/jobs/jobInterests/${jobEntity.jobInterestId}",
          data: DateAndTimeModelResponse(
              startDate: dateAndTime.startDate,
              endDate: dateAndTime.endDate,
              startTime: dateAndTime.startTime,
              comments: dateAndTime.comments
          ).toJson());

      return true;
    }on DioException catch(dioEx){
      throw(dioEx.response.toString());
    }catch(ex){
      rethrow;
    }
  }

  @override
  Future<bool> updateJobDateTime({required JobEntity jobEntity, required   DateAndTime dateAndTime})  async{
    try {
      Response<dynamic> jobResponse = await apiService.put(
          "$baseUrl$version/jobs/${jobEntity.id}",
          data: DateAndTimeModelResponse(
            startDate: dateAndTime.startDate,
            endDate: dateAndTime.endDate,
            startTime: dateAndTime.startTime,
            comments: dateAndTime.comments
          ).toJson());

      Response<dynamic> interestResponse = await apiService.put(
          "$baseUrl$version/jobs/jobInterests/${jobEntity.jobInterestId}",
          data: DateAndTimeModelResponse(
              startDate: dateAndTime.startDate,
              endDate: dateAndTime.endDate,
              startTime: dateAndTime.startTime,
              comments: dateAndTime.comments
          ).toJson());

      print(
          DateAndTimeModelResponse(
              startDate: dateAndTime.startDate,
              endDate: dateAndTime.endDate,
              startTime: dateAndTime.startTime,
              comments: dateAndTime.comments).toJson()
      );
      return true;
    }on DioException catch(dioEx){
      throw(dioEx.response.toString());
    }catch(ex){
      rethrow;
    }
  }

}