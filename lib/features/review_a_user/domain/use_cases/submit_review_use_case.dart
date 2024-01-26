import 'package:injectable/injectable.dart';
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:pickme/features/review_a_user/domain/entities/review_a_user_page_entity.dart';
import 'package:pickme/shared/constants/default_values.dart';

import '../repository/get_review_a_user_page_entity_repository.dart';
import '../repository/submit_review_repository.dart';

@Injectable()
class SubmitReviewUseCase extends BaseUseCase<SubmitReviewUseCaseParams, bool>{
  final SubmitReviewRepository repository;
  SubmitReviewUseCase({required this.repository});

  @override
  Future<bool> call({SubmitReviewUseCaseParams? params})async {
    try{
      return await repository.call(
        params: SubmitReviewRepositoryParams(
          userId: params!.userId,
          review: params.review,
          reviewerId: params.reviewerId,
          rating: params.rating,
        ),
      );
    }catch(ex){
      rethrow;
    }

  }
}
class SubmitReviewUseCaseParams extends BaseUseCaseParams{
  final int rating;
  final String review;
  final String reviewerId;
  final String userId;
  SubmitReviewUseCaseParams({
    required this.rating,
    required this.review,
    required this.reviewerId,
    required this.userId,
  });

}