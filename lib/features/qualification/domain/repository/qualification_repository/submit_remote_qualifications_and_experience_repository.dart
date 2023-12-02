import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/features/qualification/domain/entities/submit_qualification_and_experience_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';

abstract class SubmitRemoteQualificationAndExperienceRepository  extends BaseRepository<SubmitRemoteQualificationAndExperienceRepositoryParams, ProfileEntity>{}

class SubmitRemoteQualificationAndExperienceRepositoryParams extends BaseRepositoryParams{

  final SubmitQualificationAndExperienceEntity submitQualificationAndExperienceEntity;

  SubmitRemoteQualificationAndExperienceRepositoryParams({required this.submitQualificationAndExperienceEntity});
}
