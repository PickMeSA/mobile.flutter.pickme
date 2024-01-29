import 'package:pickme/shared/domain/entities/pagination_entity.dart';
import 'package:pickme/shared/domain/entities/review_entity.dart';

class ContactPageEntity{
  final List<ReviewEntity> reviews;
  final PaginationEntity paginationEntity;

  ContactPageEntity({required this.reviews, required this.paginationEntity});
}