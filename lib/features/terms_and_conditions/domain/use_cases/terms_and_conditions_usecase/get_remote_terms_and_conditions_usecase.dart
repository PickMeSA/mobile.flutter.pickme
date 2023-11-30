
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/terms_and_conditions/domain/entities/terms_and_conditions_entity.dart';
import 'package:pickme/features/terms_and_conditions/domain/repository/terms_and_conditions_repository/get_remote_terms_and_conditions_repository.dart';

@Injectable()
class GetRemoteTermsAndConditionsUseCase extends BaseUseCase<GetRemoteTermsAndConditionsUseCaseParams, TermsAndConditionsEntity>{

  final GetRemoteTermsAndConditionsRepository getRemoteTermsAndConditionsRepository;

  GetRemoteTermsAndConditionsUseCase({required this.getRemoteTermsAndConditionsRepository});

  @override
  Future<TermsAndConditionsEntity> call({GetRemoteTermsAndConditionsUseCaseParams? params}) async{
    try{
      return await getRemoteTermsAndConditionsRepository.call();
    }catch(ex){
      rethrow;
    }
  }
}

class GetRemoteTermsAndConditionsUseCaseParams extends BaseUseCaseParams{}
