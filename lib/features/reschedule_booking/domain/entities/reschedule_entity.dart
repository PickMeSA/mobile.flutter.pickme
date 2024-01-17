import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/features/reschedule_booking/data/response_models/reschedule_booking_model_response/reschedule_booking_model_response.dart';

class RescheduleEntity{

  final String jobInterestId;
  final String startDate;
  final String startTime;
  late  JobStatus status;
  final String reasonForChange;
  final String comments;


  RescheduleEntity({
    required this.reasonForChange,
    required this.startTime,
    required this.comments,
    required this.startDate,
    required this.jobInterestId,
    required this.status
});


   toJobStatus ({required String statusString}){
    switch(statusString){
      case "offered": status = JobStatus.offered;
      break;
      case "applied" : status = JobStatus.applied;
      break;
      case "Rejected" : status = JobStatus.Rejected;
      break;
      case "booked" : status = JobStatus.booked;
      break;
      case "reschedule_requested" : status = JobStatus.requestedReschedule;
      break;
      case "rescheduled" : status = JobStatus.rescheduled;
      break;
      case "cancelled" : status = JobStatus.cancelled;
      break;
      case "completed" : status = JobStatus.completed;
    }
  }

  String fromJobStatus (){
     switch(status){
       case JobStatus.offered : return "offered";

       case JobStatus.applied : return "applied";

       case JobStatus.Rejected: return "Rejected";

       case JobStatus.booked : return "booked";

       case JobStatus.rescheduled : return "rescheduled";

       case JobStatus.cancelled : return "cancelled";

       case JobStatus.completed : return "completed";

       case JobStatus.newJob: return "new_job";

       case JobStatus.active: return "active";

       case JobStatus.inactive: return "inactive";

       case JobStatus.requestedReschedule: return "reschedule_requested";

     }
  }


  RescheduleBookingModelResponse toResponse(){
     return RescheduleBookingModelResponse(
       startTime: startTime,
       comments: comments,
       jobInterestId: jobInterestId,
       reasonForChange: reasonForChange,
       startDate: startDate,
       status: fromJobStatus()
     );
  }




}

