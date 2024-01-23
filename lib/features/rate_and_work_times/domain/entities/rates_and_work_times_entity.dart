import 'package:equatable/equatable.dart';
import 'package:pickme/features/otp/data/response_models/otp_model_response/work_times_model_response.dart';
import 'package:pickme/features/rate_and_work_times/data/response_models/rate_and_work_times_model_response/submit_remote_rate_and_work_times_model_response.dart';
import 'package:pickme/features/rate_and_work_times/domain/entities/working_days_entity.dart';
import 'package:pickme/features/rate_and_work_times/domain/entities/working_days_list_entity.dart';

class RatesAndWorkTimesEntity {
  String? hourlyRate;
  String? startTime;
  String? endTime;
  WorkingDaysListEntity? workingDaysListEntity;

  RatesAndWorkTimesEntity({
    required this.hourlyRate ,
    required this.endTime,
    required this.startTime,
     this.workingDaysListEntity
  });


  Map<String,dynamic> toResponse(){
    return WorkTimesModelResponse(

        startTime: startTime,
        endTime: endTime,
        workingDays: workingDaysListEntity?.toResponse()).toJson();
  }

  RatesAndWorkTimesEntity.fromResponse(String rate,WorkTimesModelResponse workTimesModelResponse){
    hourlyRate = rate;
    startTime = workTimesModelResponse?.startTime??"";
    endTime = workTimesModelResponse?.endTime??"";
    workingDaysListEntity = WorkingDaysListEntity(workingDaysEntityList: []);
    workTimesModelResponse?.workingDays?.forEach((element) {
      workingDaysListEntity?.workingDaysEntityList?.add(WorkingDaysEntity(id:"" , day: element.toString()));
    });
  }

}