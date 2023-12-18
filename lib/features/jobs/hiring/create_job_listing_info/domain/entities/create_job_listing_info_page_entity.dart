import 'package:pickme/features/jobs/hiring/create_job_listing_info/domain/entities/info_item_entity.dart';

class CreateJobListingInfoPageEntity{
  final String description;
  final List<InfoItemEntity> information;

  CreateJobListingInfoPageEntity({required this.description, required this.information});
}