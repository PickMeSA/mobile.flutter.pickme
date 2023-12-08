import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/features/bank_details/domain/entities/bank_details_entities.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';

abstract class BankDetailsSubmittedRepository  extends BaseRepository<BankDetailsSubmittedRepositoryParams, ProfileEntity>{
}

class BankDetailsSubmittedRepositoryParams extends BaseRepositoryParams{

  final BankDetailsEntity bankDetailsEntity;

  BankDetailsSubmittedRepositoryParams({required this.bankDetailsEntity});


}
