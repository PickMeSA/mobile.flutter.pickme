import 'package:pickme/shared/domain/entities/industry_entity.dart';
import 'package:pickme/shared/domain/entities/pagination_entity.dart';

class PaginatedIndustryEntity{
  final List<IndustryEntity> industries;
  final PaginationEntity pagination;

  PaginatedIndustryEntity({required this.industries, required this.pagination});
}