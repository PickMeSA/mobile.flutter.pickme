import 'package:equatable/equatable.dart';
import 'package:pickme/features/rate_and_work_times/data/response_models/rate_and_work_times_model_response/submit_remote_rate_and_work_times_model_response.dart';
import 'package:pickme/features/rate_and_work_times/domain/entities/working_days_entity.dart';
import 'package:pickme/features/rate_and_work_times/domain/entities/working_days_list_entity.dart';

class RatesAndWorkTimesEntity {
  String hourlyRate;
  String startTime;
  String endTime;
  WorkingDaysListEntity? workingDaysListEntity;

  RatesAndWorkTimesEntity({
    required this.hourlyRate ,
    required this.endTime,
    required this.startTime,
     this.workingDaysListEntity
  });


  SubmitRemoteRateAndWorkTimesModelResponse toResponse(){
    return SubmitRemoteRateAndWorkTimesModelResponse(
        hourlyRate: hourlyRate,
        startTime: startTime,
        endTime: endTime,
        workDays: workingDaysListEntity?.toResponse());
  }

}