import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';

import '../entities/final_details_entity.dart';

abstract class SubmitFinalDetailsRepository extends BaseRepository<SubmitFinalDetailsRepositoryParams, ProfileEntity>{

}
class SubmitFinalDetailsRepositoryParams extends BaseRepositoryParams{
  final FinalDetailsEntity finalDetailsEntity;

  SubmitFinalDetailsRepositoryParams({required this.finalDetailsEntity});
}