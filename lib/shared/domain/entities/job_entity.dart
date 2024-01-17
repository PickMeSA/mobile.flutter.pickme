import 'package:equatable/equatable.dart';
import 'package:pickme/shared/models/jobs/my_job_listings_job_model_response.dart';
import 'package:pickme/shared/constants/default_values.dart';

class JobEntity extends Equatable{
final String title;
final String description;
final String status;
final String? address;
final double? hourlyRate;
final DateTime? startDate;
final DateTime? endDate;
final String? startTime;
final double estimatedHours;
final String lat;
final String lng;
final String images;
final String skills;
final String comments;
final String id;
final double? distance;

  const JobEntity({
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
        lat: response.lat.toString()??"",
        lng: response.lng.toString()??"",
        skills: response.skills??"",
        id: response.id!,
        distance: response.distance??0
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
        lat: lat.toString(),
        lng: lng,
        skills: skills,
        id: id,
        distance: distance
    );
  }
  @override
  List<Object?> get props => [id];
}