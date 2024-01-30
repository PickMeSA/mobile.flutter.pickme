import 'package:injectable/injectable.dart';
import 'package:pickme/features/contact/data/service/get_contact_page_entity_service.dart';
import 'package:pickme/features/contact/domain/entities/contact_page_entity.dart';
import '../../domain/repository/get_my_reviews_page_entity_repository.dart';

@Injectable(as: GetContactPageEntityRepository)
class GetContactPageEntityRepositoryImpl extends GetContactPageEntityRepository{
  ContactPageService reviewsService;

  GetContactPageEntityRepositoryImpl({required this.reviewsService});

  @override
  Future<ContactPageEntity> call({GetContactPageEntityRepositoryParams? params}) async {
    return await reviewsService.getMyReviews(params: params!);
  }

}