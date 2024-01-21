import 'package:injectable/injectable.dart';
import 'package:pickme/features/my_reviews/data/service/get_my_reviews_page_entity_service.dart';
import 'package:pickme/features/my_reviews/domain/entities/my_reviews_page_entity.dart';
import '../../domain/repository/get_my_reviews_page_entity_repository.dart';

@Injectable(as: GetMyReviewsPageEntityRepository)
class GetMyReviewsPageEntityRepositoryImpl extends GetMyReviewsPageEntityRepository{
  MyReviewsService reviewsService;

  GetMyReviewsPageEntityRepositoryImpl({required this.reviewsService});

  @override
  Future<MyReviewsPageEntity> call({GetMyReviewsRepositoryParams? params}) async {
    return await reviewsService.getMyReviews(params: params!);
  }

}