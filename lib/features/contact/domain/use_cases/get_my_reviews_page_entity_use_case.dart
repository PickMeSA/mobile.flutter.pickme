import 'package:injectable/injectable.dart';
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:pickme/features/contact/domain/entities/contact_page_entity.dart';
import 'package:pickme/features/contact/domain/repository/get_my_reviews_page_entity_repository.dart';
import 'package:pickme/shared/constants/default_values.dart';

@Injectable()
class GetContactPageEntityUseCase extends BaseUseCase<GetContactPageEntityUseCaseParams, ContactPageEntity>{
  GetContactPageEntityRepository repository;

  GetContactPageEntityUseCase({required this.repository});

  @override
  Future<ContactPageEntity> call({GetContactPageEntityUseCaseParams? params}) {
    try{
      return repository.call(params: GetContactPageEntityRepositoryParams(userId: params!.userId));
    }catch(ex){
      logger.e(ex);
      rethrow;
    }
  }
}
class GetContactPageEntityUseCaseParams extends BaseUseCaseParams{
  final String userId;

  GetContactPageEntityUseCaseParams({required this.userId});

}