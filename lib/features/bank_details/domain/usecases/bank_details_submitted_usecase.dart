
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/bank_details/domain/entities/bank_details_entities.dart';
import 'package:pickme/features/bank_details/domain/repository/bank_details_submitted_repository.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';

@Injectable()
class BankDetailsSubmittedUseCase extends BaseUseCase<BankDetailsSubmittedUseCaseParams, ProfileEntity>{

  final BankDetailsSubmittedRepository bankDetailsSubmittedRepository;

  BankDetailsSubmittedUseCase({required this.bankDetailsSubmittedRepository});

  @override
  Future<ProfileEntity> call({BankDetailsSubmittedUseCaseParams? params}) async {
    try{
      return await bankDetailsSubmittedRepository.call(
          params: BankDetailsSubmittedRepositoryParams(bankDetailsEntity: params!.bankDetailsEntity));
    }catch(ex){
      rethrow;
    }
  }

}



class BankDetailsSubmittedUseCaseParams extends BaseUseCaseParams{
  final BankDetailsEntity bankDetailsEntity;

  BankDetailsSubmittedUseCaseParams({required this.bankDetailsEntity});
}
