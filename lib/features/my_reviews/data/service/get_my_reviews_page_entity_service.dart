import 'package:pickme/features/my_reviews/domain/entities/my_reviews_page_entity.dart';
import 'package:pickme/features/my_reviews/domain/repository/get_my_reviews_page_entity_repository.dart';
import 'package:pickme/shared/remote/PickMeApiCore.dart';

abstract class MyReviewsService extends PickMeCoreApi{
  Future<MyReviewsPageEntity> getMyReviews({required GetMyReviewsRepositoryParams params});
}