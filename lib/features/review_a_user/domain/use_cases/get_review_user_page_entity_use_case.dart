import 'package:injectable/injectable.dart';
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:pickme/features/review_a_user/domain/entities/review_a_user_page_entity.dart';

import '../repository/get_review_a_user_page_entity_repository.dart';

@Injectable()
class GetReviewUserPageEntityUseCase extends BaseUseCase<GetReviewUserPageEntityUseCaseParams, ReviewAUserPageEntity>{
  final GetReviewUserPageEntityRepository repository;
  GetReviewUserPageEntityUseCase({required this.repository});

  @override
  Future<ReviewAUserPageEntity> call({GetReviewUserPageEntityUseCaseParams? params}) {
    return repository.call(params: GetReviewUserPageEntityRepositoryParams(userId: params!.userId));
  }
}
class GetReviewUserPageEntityUseCaseParams extends BaseUseCaseParams{
  final String userId;
  GetReviewUserPageEntityUseCaseParams({required this.userId});

}