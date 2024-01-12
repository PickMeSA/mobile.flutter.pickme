import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/features/bank_details/domain/entities/bank_details_entities.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_payment_details_entity.dart';

abstract class GetBankingDetailsRepository  extends BaseRepository<GetBankingDetailsRepositoryParams,  OTPPaymentDetailsEntity>{}

class GetBankingDetailsRepositoryParams extends BaseRepositoryParams{}
