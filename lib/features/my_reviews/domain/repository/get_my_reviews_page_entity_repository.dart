import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/features/my_reviews/domain/entities/my_reviews_page_entity.dart';

abstract class GetMyReviewsPageEntityRepository extends BaseRepository<GetMyReviewsRepositoryParams, MyReviewsPageEntity>{}

class GetMyReviewsRepositoryParams extends BaseRepositoryParams{
  final String userId;

  GetMyReviewsRepositoryParams({required this.userId});
}