import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/features/review_a_user/domain/entities/review_a_user_page_entity.dart';

abstract class SubmitReviewRepository extends BaseRepository<SubmitReviewRepositoryParams, bool>{}

class SubmitReviewRepositoryParams extends BaseRepositoryParams{
  final int rating;
  final String review;
  final String reviewerId;
  final String userId;
  SubmitReviewRepositoryParams({
    required this.rating,
    required this.review,
    required this.reviewerId,
    required this.userId,
  });
}