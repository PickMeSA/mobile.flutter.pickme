import 'package:pickme/features/contact/domain/entities/contact_page_entity.dart';
import 'package:pickme/features/contact/domain/repository/get_my_reviews_page_entity_repository.dart';
import 'package:pickme/shared/remote/PickMeApiCore.dart';

abstract class ContactPageService extends PickMeCoreApi{
  Future<ContactPageEntity> getMyReviews({required GetContactPageEntityRepositoryParams params});
}