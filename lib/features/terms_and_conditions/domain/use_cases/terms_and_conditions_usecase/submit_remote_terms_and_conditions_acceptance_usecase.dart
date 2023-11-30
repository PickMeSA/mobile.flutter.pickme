
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/terms_and_conditions/domain/repository/terms_and_conditions_repository/submit_remote_terms_and_conditions_acceptance_repository.dart';

@Injectable()
class SubmitRemoteTermsAndConditionsAcceptanceUseCase extends BaseUseCase<SubmitRemoteTermsAndConditionsAcceptanceUseCaseParams, bool>{

  final SubmitRemoteTermsAndConditionsAcceptanceRepository submitRemoteTermsAndConditionsAcceptanceRepository;

  SubmitRemoteTermsAndConditionsAcceptanceUseCase({required this.submitRemoteTermsAndConditionsAcceptanceRepository});

  @override
  Future<bool> call({SubmitRemoteTermsAndConditionsAcceptanceUseCaseParams? params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class SubmitRemoteTermsAndConditionsAcceptanceUseCaseParams extends BaseUseCaseParams{}
