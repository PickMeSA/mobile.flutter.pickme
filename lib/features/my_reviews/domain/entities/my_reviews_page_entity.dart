import 'package:pickme/shared/domain/entities/pagination_entity.dart';
import 'package:pickme/shared/domain/entities/review_entity.dart';

class MyReviewsPageEntity{
  final List<ReviewEntity> reviews;
  final PaginationEntity paginationEntity;

  MyReviewsPageEntity({required this.reviews, required this.paginationEntity});
}