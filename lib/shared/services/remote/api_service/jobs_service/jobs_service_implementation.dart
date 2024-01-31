

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
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
    MyJobListingsJobModelResponse jobsModelResponse = MyJobListingsJobModelResponse.fromJson(response.data);
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

}