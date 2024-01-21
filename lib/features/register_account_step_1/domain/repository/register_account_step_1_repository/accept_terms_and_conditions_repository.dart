import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';

abstract class AcceptTermsAndConditionsRepository  extends BaseRepository<AcceptTermsAndConditionsRepositoryParams, ProfileEntity>{}

class AcceptTermsAndConditionsRepositoryParams extends BaseRepositoryParams{}
