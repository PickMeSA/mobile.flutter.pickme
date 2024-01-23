
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/register_account_step_1/domain/repository/register_account_step_1_repository/accept_terms_and_conditions_repository.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';

@Injectable()
class AcceptTermsAndConditionsUseCase extends BaseUseCase<AcceptTermsAndConditionsUseCaseParams, ProfileEntity>{

  final AcceptTermsAndConditionsRepository acceptTermsAndConditionsRepository;

  AcceptTermsAndConditionsUseCase({required this.acceptTermsAndConditionsRepository});

  @override
  Future<ProfileEntity> call({AcceptTermsAndConditionsUseCaseParams? params})async  {
    try{
      return await acceptTermsAndConditionsRepository.call();
    }catch(ex){
      rethrow;
    }
  }
}

class AcceptTermsAndConditionsUseCaseParams extends BaseUseCaseParams{}
