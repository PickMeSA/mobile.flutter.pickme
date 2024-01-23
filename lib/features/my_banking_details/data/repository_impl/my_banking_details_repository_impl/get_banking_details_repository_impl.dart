import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/bank_details/domain/entities/bank_details_entities.dart';
import 'package:pickme/features/my_banking_details/domain/repository/my_banking_details_repository/get_banking_details_repository.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_payment_details_entity.dart';
import 'package:pickme/shared/services/remote/api_service/profile_service/profile_service.dart';

@Injectable(as: GetBankingDetailsRepository)
class GetBankingDetailsRepositoryImpl extends GetBankingDetailsRepository {
  final ProfileService profileService;
  GetBankingDetailsRepositoryImpl({required this.profileService});

  @override
  Future<OTPPaymentDetailsEntity> call({GetBankingDetailsRepositoryParams? params}) async{
    try{
      return await profileService.getBankDetails();
    }catch(ex){
      rethrow;
    }
  }

}
