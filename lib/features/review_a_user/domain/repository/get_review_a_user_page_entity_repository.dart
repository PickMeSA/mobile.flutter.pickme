import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/features/review_a_user/domain/entities/review_a_user_page_entity.dart';

abstract class GetReviewUserPageEntityRepository extends BaseRepository<GetReviewUserPageEntityRepositoryParams, ReviewAUserPageEntity>{}

class GetReviewUserPageEntityRepositoryParams extends BaseRepositoryParams{
  final String userId;

  GetReviewUserPageEntityRepositoryParams({required this.userId});
}