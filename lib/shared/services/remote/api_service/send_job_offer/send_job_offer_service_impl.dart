import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/jobs/shared/data/models/send_job_offer_model_request.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/domain/entities/candidate_profile_entity.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/remote/api-service.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';
import 'package:pickme/shared/services/remote/api_service/profile_service/profile_service.dart';

import 'send_job_offer_service.dart';

@Singleton(as: SendJobOfferService)
class SendJobOfferServiceImpl extends SendJobOfferService{

  final ApiService apiService;
  final ProfileService profileService;

  SendJobOfferServiceImpl({required this.apiService, required this.profileService, });
 
  @override
  Future<bool> sendOffer({required JobEntity job, required CandidateProfileEntity candidateProfileEntity}) async{
    UserModel userModel = boxUser.get(current);
    try{
      Map<String, dynamic> params = {
        "jobId": job.id,
        "customerUid": userModel.id.toString(),
        "labourerUid": candidateProfileEntity.id,
        "startDate": job.startDate,
        "endDate": job.endDate,
        "startTime": job.startTime,
        "estimatedHours": job.estimatedHours,
        "comments": job.comments,
        "type": "offer",
        "status": "offered",
        "bookingId": ""
      };
      logger.d(params);
      Response<dynamic> response = await apiService.post("$baseUrl$version/jobs/jobInterest",
          queryParameters: params);
      logger.i(response.data);
      if(response.data["id"]!=null){
        return true;
      }
      return false;
    }catch(ex){
      debugPrint({
        "jobId": job.id,
        "customerUid": userModel.id,
        "labourerUid": candidateProfileEntity.id,
        "startDate": job.startDate?.toIso8601String(),
        "endDate": job.endDate?.toIso8601String(),
        "startTime": job.startTime,
        "estimatedHours": job.estimatedHours,
        "comments": job.comments,
        "type": "offer",
        "status": "offered",
        "bookingId": ""
      }.toString());
      rethrow;
    }
  }

}