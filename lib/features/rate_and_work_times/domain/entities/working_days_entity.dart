import 'package:pickme/features/rate_and_work_times/data/response_models/rate_and_work_times_model_response/work_days_model_response.dart';

class WorkingDaysEntity {

  final String id;
  final String day;

  WorkingDaysEntity({required this.id,
  required this.day});


   WorkDaysModelResponse toResponse(){
     return WorkDaysModelResponse(id: id, day: day);
   }
}