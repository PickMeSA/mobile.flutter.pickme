import 'package:equatable/equatable.dart';
import 'package:pickme/shared/models/job_offer/job_offer_model_response.dart';

import 'job_customer_entity.dart';

class JobOfferEntity extends Equatable {
  final String id;
  final String jobId;
  final String customerUid;
  final String labourerUid;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? startTime;
  final double estimatedHours;
  final String comments;
  final String type;
  final String status;
  final String reasonForChange;
  final DateTime? proposedAltStartDate;
  final DateTime? proposedAltEndDate;
  final String proposedAltStartTime;
  final String proposerUid;
  final JobCustomerEntity customer;
  final JobDataEntity jobData;

  const JobOfferEntity({
    required this.id,
    required this.jobId,
    required this.customerUid,
    required this.labourerUid,
    this.startDate,
    this.endDate,
    this.startTime,
    required this.estimatedHours,
    required this.comments,
    required this.type,
    required this.status,
    required this.reasonForChange,
    required this.proposedAltStartDate,
    required this.proposedAltEndDate,
    required this.proposedAltStartTime,
    required this.proposerUid,
    required this.customer,
    required this.jobData,
  });
  static JobOfferEntity fromResponse(JobOfferModel response) {
    return JobOfferEntity(
      id: response.id,
      jobId: response.jobId,
      customerUid: response.customerUid,
      labourerUid: response.labourerUid,
      startDate: response.startDate,
      endDate: response.endDate,
      startTime: response.startTime,
      estimatedHours: response.estimatedHours,
      comments: response.comments ?? "", // Replace with a default value if needed
      type: response.type,
      status: response.status,
      reasonForChange: response.reasonForChange ?? "", // Replace with a default value if needed
      proposedAltStartDate: response.proposedAltStartDate,
      proposedAltEndDate: response.proposedAltEndDate,
      proposedAltStartTime: response.proposedAltStartTime ?? "", // Replace with a default value if needed
      proposerUid: response.proposerUid ?? "", // Replace with a default value if needed
      customer: JobCustomerEntity(
        id: response.customer.id,
        firstName: response.customer.firstName,
        surname: response.customer.surname,
        averageRating: response.customer.averageRating,
        profileImage: response.customer.profileImage ?? "", // Replace with a default value if needed
        address: response.customer.address ?? "", // Replace with a default value if needed
      ),
      jobData: JobDataEntity(
        title: response.job.title,
        address: response.job.address ?? "", // Replace with a default value if needed
      ),
    );
  }

  @override
  List<Object?> get props => [
    id,
  ];
}


class JobDataEntity extends Equatable {
  final String title;
  final String? address;

  const JobDataEntity({
    required this.title,
    this.address,
  });

  @override
  List<Object?> get props => [title, address];
}