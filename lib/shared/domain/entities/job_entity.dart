import 'package:equatable/equatable.dart';
import 'package:pickme/shared/models/jobs/my_job_listings_job_model_response.dart';
import 'package:pickme/shared/constants/default_values.dart';

class JobEntity extends Equatable{
 String? title;
 String? description;
 String? status;
 String? address;
 double? hourlyRate;
 DateTime? startDate;
 DateTime? endDate;
 String? startTime;
 double? estimatedHours;
 double? lat;
 double? lng;
 String? images;
 String? skills;
 String? comments;
 String? id;
 double? distance;

JobEntity.blank();

   JobEntity({
    required this.title,
    required this.description,
    required this.status,
    this.address,
    this.hourlyRate,
    this.startDate,
    this.endDate,
    this.startTime,
    required this.estimatedHours,
    required this.lat,
    required this.lng,
    required this.images,
    required this.skills,
    this.comments = "",
    required this.id,
    this.distance
  });
  factory JobEntity.fromResponse(MyJobListingsJobModelResponse response){
    logger.e({"response": response.startDate});
    return JobEntity(
        title: response.title??"",
        startDate: response.startDate!=null && response.startDate!= ""?DateTime.parse(response.startDate!):DateTime.now(),
        endDate: response.endDate!=null && response.endDate != ""?DateTime.parse(response.endDate!):DateTime.now(),
        startTime: response.startTime,
        description: response.description??"",
        images: response.images??"",
        status: response.status??"",
        estimatedHours: response.estimatedHours??0,
        lat: response.lat,
        lng: response.lng,
        skills: response.skills??"",
        id: response.id??"",
        distance: response.distance??0,
      address: response.address??"",

    );
  }

  MyJobListingsJobModelResponse toMyJobListingsJobModelResponse(){
    return MyJobListingsJobModelResponse(
        title: title,
        description: description,
        images: images,
        status: status,
        startDate: startDate!.toIso8601String(),
        endDate: endDate!.toIso8601String(),
        startTime: startTime!,
        estimatedHours: estimatedHours,
        lat: lat,
        lng: lng,
        skills: skills,
        id: id,
        distance: distance
    );
  }
  @override
  List<Object?> get props => [id];
}