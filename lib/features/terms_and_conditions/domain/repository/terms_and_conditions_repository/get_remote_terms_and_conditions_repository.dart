import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/features/terms_and_conditions/domain/entities/terms_and_conditions_entity.dart';

abstract class GetRemoteTermsAndConditionsRepository  extends BaseRepository<GetRemoteTermsAndConditionsRepositoryParams, TermsAndConditionsEntity>{}

class GetRemoteTermsAndConditionsRepositoryParams extends BaseRepositoryParams{}
