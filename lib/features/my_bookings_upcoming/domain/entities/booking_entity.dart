import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/features/my_bookings_upcoming/data/response_models/my_bookings_upcoming_model_response/booking_model_response.dart';
import 'package:pickme/features/my_bookings_upcoming/data/response_models/my_bookings_upcoming_model_response/customer_model_response.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/entities/customer_entity.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/models/jobs/my_job_listings_job_model_response.dart';

class BookingEntity{
  late String id;
  late String customerUid;
  late String labourerUid;
  late String startDate;
  late String endDate;
  late int estimatedHours;
  late String comments;
  late String type;
  late String applied;
  late String bookingId;
  late String jobId;
  late JobStatus status;
  late JobStatus previousStatus;
  late String previousStatusString;
  late String statusString;
  late String reasonForChange;
  late String proposedAltStartDate;
  late String proposedAltEndDate;
  late String proposedAltStartTime;
  late String proposerUid;
  late JobEntity job;
  late CustomerEntity? customer;

  BookingEntity({
    required this.previousStatusString,
    required this.statusString,
    required this.id,
    required this.endDate,
    required this.startDate,
    required this.type,
    required this.applied,
    required this.bookingId,
    required this.comments,
    required this.customerUid,
    required this.estimatedHours,
    required this.labourerUid,
    required this.jobId,
    required this.reasonForChange,
    required this.customer,
    required this.job,
    required this.proposedAltEndDate,
    required this.proposedAltStartDate,
    required this.proposedAltStartTime,
    required this.proposerUid

}){
    toJobStatus(statusString: statusString);
  }
  
  BookingEntity.fromResponse ({required BookingsModelResponse element}){
        previousStatusString= element.previousStatus??"";
        statusString= element.status??"";
        jobId= element.jobId??"";
        id= element.id??"";
        endDate= element.endDate??DateTime.now().toString();
        startDate= element.startDate?? DateTime.now().toString();
        type= element.type??"Unknown";
        applied= element.applied??"";
        bookingId= element.bookingId??"";
        comments= element.comments??"";
        customerUid= element.customerUid??"";
        estimatedHours= element.estimatedHours??0;
        labourerUid= element.labourerUid??"";
        reasonForChange= element.reasonForChange!;
        customer= CustomerEntity.fromResponse(element.customer??CustomerModelResponse());
        job= JobEntity.fromResponse(element.job??MyJobListingsJobModelResponse());
        proposedAltEndDate= element.proposedAltEndDate!;
        proposedAltStartDate= element.proposedAltStartDate!;
        proposedAltStartTime= element.proposedAltStartTime!;
        proposerUid= element.proposerUid!;
  }

  toJobStatus ({required String statusString}){
    switch(statusString){
      case "offered": status = JobStatus.offered;
      break;
      case "applied" : status = JobStatus.applied;
      break;
      case "Rejected" : status = JobStatus.rejected;
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
      break;
      case "reschedule_declined": status = JobStatus.rescheduleDeclined;
      break;
      case "alternative_proposed": status = JobStatus.alternativeProposed;
      break;
      case "alternative_declined" : status = JobStatus.alternativeDeclined;
      break;
      case "alternative_accepted": status = JobStatus.alternativeAccepted;
    }
  }
}