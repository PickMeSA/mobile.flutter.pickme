import 'package:flutter_ui_components/flutter_ui_components.dart';

class BookingEntity{
  final String id;
  final String customerUid;
  final String labourerUid;
  final String startDate;
  final String endDate;
  final int estimatedHours;
  final String comments;
  final String type;
  final String applied;
  final String bookingId;
  final String jobId;
  late JobStatus status;
  final String statusString;

  BookingEntity({
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
    required this.jobId
}){
    toJobStatus(statusString: statusString);
  }

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
}