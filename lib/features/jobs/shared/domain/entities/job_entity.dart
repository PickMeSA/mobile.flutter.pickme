import 'package:equatable/equatable.dart';
import 'package:pickme/features/jobs/hiring/my_job_listings/data/models/my_job_listings_job_model_response.dart';
import 'package:pickme/shared/constants/default_values.dart';

class JobEntity extends Equatable{
final String title;
final String description;
final String status;
final DateTime? startDate;
final DateTime? endDate;
final String? startTime;
final double estimatedHours;
final double lat;
final double lng;
final String images;
final String skills;
final String id;
final double distance;

  const JobEntity({required this.title, required this.description, required this.status, this.startDate, this.endDate, this.startTime, required this.estimatedHours, required this.lat, required this.lng, required this.images, required this.skills, required this.id, required this.distance});
  factory JobEntity.fromResponse(MyJobListingsJobModelResponse response){
    logger.e({"response": response.startDate});
    return JobEntity(
        title: response.title,
        startDate: (response.startDate!=null)?DateTime.parse(response.startDate!):null,
        endDate: (response.endDate!=null)?DateTime.parse(response.endDate!):null,
        startTime: response.startTime,
        description: response.description,
        images: response.images,
        status: response.status,
        estimatedHours: response.estimatedHours,
        lat: response.lat,
        lng: response.lng,
        skills: response.skills,
        id: response.id!,
        distance: response.distance
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