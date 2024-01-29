import 'package:injectable/injectable.dart';
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:pickme/features/my_reviews/domain/entities/my_reviews_page_entity.dart';
import 'package:pickme/features/my_reviews/domain/repository/get_my_reviews_page_entity_repository.dart';
import 'package:pickme/shared/constants/default_values.dart';

@Injectable()
class GetMyReviewsPageEntityUseCase extends BaseUseCase<GetMyReviewsUseCaseParams, MyReviewsPageEntity>{
  GetMyReviewsPageEntityRepository repository;

  GetMyReviewsPageEntityUseCase({required this.repository});

  @override
  Future<MyReviewsPageEntity> call({GetMyReviewsUseCaseParams? params}) {
    try{
      return repository.call(params: GetMyReviewsRepositoryParams(userId: params!.userId));
    }catch(ex){
      logger.e(ex);
      rethrow;
    }
  }
}
class GetMyReviewsUseCaseParams extends BaseUseCaseParams{
  final String userId;

  GetMyReviewsUseCaseParams({required this.userId});

}