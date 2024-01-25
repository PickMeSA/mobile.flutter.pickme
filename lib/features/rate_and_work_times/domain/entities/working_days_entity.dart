import 'package:equatable/equatable.dart';
import 'package:pickme/features/rate_and_work_times/data/response_models/rate_and_work_times_model_response/work_days_model_response.dart';

class WorkingDaysEntity extends Equatable {

  final String id;
  final String day;

  const WorkingDaysEntity({required this.id,
  required this.day});


   WorkDaysModelResponse toResponse(){
     return WorkDaysModelResponse(id: id, day: day);
   }

  @override
  // TODO: implement props
  List<Object?> get props =>[id,day];
}