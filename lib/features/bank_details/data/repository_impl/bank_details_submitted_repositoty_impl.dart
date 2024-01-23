import 'package:injectable/injectable.dart';
import 'package:pickme/features/bank_details/domain/repository/bank_details_submitted_repository.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/services/remote/api_service/profile_service/profile_service.dart';

@Injectable(as: BankDetailsSubmittedRepository)
class BankDetailsSubmittedRepositoryImpl extends BankDetailsSubmittedRepository{
  final ProfileService profileService;

  BankDetailsSubmittedRepositoryImpl({required this.profileService});

  @override
  Future<ProfileEntity> call({BankDetailsSubmittedRepositoryParams? params}) {
    return profileService.submitBankDetails(bankDetailsEntity: params!.bankDetailsEntity);
  }
}