import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/domain/entities/paginated_industry_object.dart';

class JobsLandingPageEntity{
  final List<JobEntity> recommendedJobs;
  final PaginatedIndustryEntity services;
  JobsLandingPageEntity({required this.recommendedJobs, required this.services});
}