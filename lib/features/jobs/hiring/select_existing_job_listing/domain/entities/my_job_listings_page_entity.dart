import 'package:pickme/features/jobs/hiring/my_job_listings/data/models/my_job_listings_job_model_response.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';


class MyJobListingsPageEntity {
  final List<JobEntity> activeJobs;
  final List<JobEntity> inactiveJobs;
  final ProfileEntity profile;

  MyJobListingsPageEntity({required this.activeJobs, required this.inactiveJobs, required this.profile});

  factory MyJobListingsPageEntity.fromResponse({
    required List<dynamic> listingsResponse,
    required ProfileEntity profile,
      }){
    try{
      return MyJobListingsPageEntity(
          activeJobs: listingsResponse.where((element) => element['status']=="active").map(
                  (e) => JobEntity.fromResponse(MyJobListingsJobModelResponse.fromJson(e))).toList(),
          inactiveJobs: listingsResponse.where((element) => element['status']!="active").map(
                  (e)=>JobEntity.fromResponse(MyJobListingsJobModelResponse.fromJson(e))).toList(),
          profile: profile
      );
    }catch(ex){
      logger.e(ex);
      rethrow;
    }
  }
}