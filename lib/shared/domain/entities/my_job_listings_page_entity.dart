import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';

import '../../models/jobs/my_job_listings_job_model_response.dart';

class MyJobListingsPageEntity {
  final List<JobEntity> activeJobs;
  final List<JobEntity> inactiveJobs;

  MyJobListingsPageEntity({required this.activeJobs, required this.inactiveJobs});

  factory MyJobListingsPageEntity.fromResponse({
    required List<dynamic> listingsResponse,
      }){
    try{
      return MyJobListingsPageEntity(
          activeJobs: listingsResponse.where((element) => element['status']=="active").map(
                  (e) => JobEntity.fromResponse(MyJobListingsJobModelResponse.fromJson(e))).toList(),
          inactiveJobs: listingsResponse.where((element) => element['status']!="active").map(
                  (e)=>JobEntity.fromResponse(MyJobListingsJobModelResponse.fromJson(e))).toList(),
      );
    }catch(ex){
      logger.e(ex);
      rethrow;
    }
  }
}