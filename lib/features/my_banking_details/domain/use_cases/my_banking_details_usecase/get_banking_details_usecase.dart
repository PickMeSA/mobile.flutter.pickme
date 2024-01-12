
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/bank_details/domain/entities/bank_details_entities.dart';
import 'package:pickme/features/my_banking_details/domain/repository/my_banking_details_repository/get_banking_details_repository.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_payment_details_entity.dart';

@Injectable()
class GetBankingDetailsUseCase extends BaseUseCase<GetBankingDetailsUseCaseParams,   OTPPaymentDetailsEntity>{

  final GetBankingDetailsRepository getBankingDetailsRepository;

  GetBankingDetailsUseCase({required this.getBankingDetailsRepository});

  @override
  Future<OTPPaymentDetailsEntity> call({GetBankingDetailsUseCaseParams? params}) {
  try{
    return getBankingDetailsRepository.call();
  }catch(ex){
    rethrow;
  }
  }
}

class GetBankingDetailsUseCaseParams extends BaseUseCaseParams{}
