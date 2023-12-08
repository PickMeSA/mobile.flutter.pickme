import 'package:pickme/features/rate_and_work_times/data/response_models/rate_and_work_times_model_response/work_days_list_model_response.dart';
import 'package:pickme/features/rate_and_work_times/data/response_models/rate_and_work_times_model_response/work_days_model_response.dart';
import 'package:pickme/features/rate_and_work_times/domain/entities/working_days_entity.dart';


class WorkingDaysListEntity{
  List<WorkingDaysEntity>? workingDays;

  WorkingDaysListEntity({ this.workingDays});

  WorkDaysListModelResponse toResponse(){

    List<WorkDaysModelResponse> workDays =  [];

    workingDays?.forEach((element) {
      workDays.add(element.toResponse());

    });

    WorkDaysListModelResponse workDaysListModelResponse = WorkDaysListModelResponse(workDays: workDays);

    return workDaysListModelResponse;
  }
}


