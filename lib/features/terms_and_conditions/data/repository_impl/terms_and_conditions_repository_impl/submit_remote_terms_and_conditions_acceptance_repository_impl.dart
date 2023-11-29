import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/terms_and_conditions/domain/repository/terms_and_conditions_repository/submit_remote_terms_and_conditions_acceptance_repository.dart';

@Injectable(as: SubmitRemoteTermsAndConditionsAcceptanceRepository)
class SubmitRemoteTermsAndConditionsAcceptanceRepositoryImpl extends SubmitRemoteTermsAndConditionsAcceptanceRepository {

  SubmitRemoteTermsAndConditionsAcceptanceRepositoryImpl();

  @override
  Future<bool> call({SubmitRemoteTermsAndConditionsAcceptanceRepositoryParams? params}) {
    // TODO: implement call
    throw UnimplementedError();
  }

}
