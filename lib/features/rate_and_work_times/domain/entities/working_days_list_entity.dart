import 'package:pickme/features/rate_and_work_times/data/response_models/rate_and_work_times_model_response/work_days_list_model_response.dart';
import 'package:pickme/features/rate_and_work_times/data/response_models/rate_and_work_times_model_response/work_days_model_response.dart';
import 'package:pickme/features/rate_and_work_times/domain/entities/working_days_entity.dart';


class WorkingDaysListEntity{
  List<WorkingDaysEntity>? workingDaysEntityList = [];

  WorkingDaysListEntity({ this.workingDaysEntityList});

  List<String> toResponse(){

    List<String> workingDays =  [];

    workingDaysEntityList?.forEach((element) {
      workingDays.add(element.day);

    });


    return workingDays;
  }


}


