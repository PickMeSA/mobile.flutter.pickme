import 'package:equatable/equatable.dart';

class JobEntity extends Equatable{
final String title;
final String description;
final String status;
final DateTime startDate;
final DateTime endDate;
final String startTime;
final double estimatedHours;
final double lat;
final double lng;
final String images;
final String skills;
final String id;
final double distance;

  const JobEntity({required this.title, required this.description, required this.status, required this.startDate, required this.endDate, required this.startTime, required this.estimatedHours, required this.lat, required this.lng, required this.images, required this.skills, required this.id, required this.distance});

  @override
  List<Object?> get props => [id];
}