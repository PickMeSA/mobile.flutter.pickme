import 'package:injectable/injectable.dart';
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:pickme/features/my_reviews/domain/entities/my_reviews_page_entity.dart';

@Injectable()
class GetMyReviewsPageEntityUseCase1 extends BaseUseCase<GetMyReviewsUseCaseParams, MyReviewsPageEntity>{

  GetMyReviewsPageEntityUseCase1();

  @override
  Future<MyReviewsPageEntity> call({GetMyReviewsUseCaseParams? params}) {
    throw " not implemented";
  }
}
class GetMyReviewsUseCaseParams extends BaseUseCaseParams{
  final String userId;

  GetMyReviewsUseCaseParams({required this.userId});

}