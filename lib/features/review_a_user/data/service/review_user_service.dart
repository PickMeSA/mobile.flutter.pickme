import 'package:pickme/features/review_a_user/domain/repository/submit_review_repository.dart';
import 'package:pickme/shared/remote/PickMeApiCore.dart';

abstract class SubmitReviewService extends PickMeCoreApi{
  Future<bool> submitReview({required SubmitReviewRepositoryParams params});
}