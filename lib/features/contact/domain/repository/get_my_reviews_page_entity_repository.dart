import 'package:pickme/base_classes/base_repository.dart';

import '../entities/contact_page_entity.dart';

abstract class GetContactPageEntityRepository extends BaseRepository<GetContactPageEntityRepositoryParams, ContactPageEntity>{}

class GetContactPageEntityRepositoryParams extends BaseRepositoryParams{
  final String userId;

  GetContactPageEntityRepositoryParams({required this.userId});
}