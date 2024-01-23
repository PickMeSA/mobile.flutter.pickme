import 'package:flutter_ui_components/flutter_ui_components.dart';

class CreateJobPageJobEntity {
  final String title;
  final String description;
  final String address;
  final String status;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? startTime;
  final bool imFlexible;
  final String estimatedHours;
  final String lat;
  final String lng;
  final double rate;
  final List<String> images;
  final List<ChipOption> skills;

  CreateJobPageJobEntity({required this.title, required this.description, required this.address, required this.status, this.startDate, this.endDate, this.startTime, required this.imFlexible, required this.estimatedHours, required this.rate, required this.lat, required this.lng, required this.images, required this.skills});
}