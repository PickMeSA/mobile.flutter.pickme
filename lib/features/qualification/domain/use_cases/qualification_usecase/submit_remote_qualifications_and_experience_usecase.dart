
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/qualification/domain/entities/submit_qualification_and_experience_entity.dart';
import 'package:pickme/features/qualification/domain/repository/qualification_repository/submit_remote_qualifications_and_experience_repository.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';

@Injectable()
class SubmitRemoteQualificationAndExperienceUseCase extends BaseUseCase<SubmitRemoteQualificationAndExperienceUseCaseParams, ProfileEntity>{

  final SubmitRemoteQualificationAndExperienceRepository submitRemoteQualificationAndExperienceRepository;

  SubmitRemoteQualificationAndExperienceUseCase({required this.submitRemoteQualificationAndExperienceRepository});

  @override
  Future<ProfileEntity> call({SubmitRemoteQualificationAndExperienceUseCaseParams? params})async {
    try{
      return await submitRemoteQualificationAndExperienceRepository.call(
          params: SubmitRemoteQualificationAndExperienceRepositoryParams(
          submitQualificationAndExperienceEntity: params!.submitQualificationAndExperienceEntity));
    }catch(ex){
      rethrow;
    }
  }
}

class SubmitRemoteQualificationAndExperienceUseCaseParams extends BaseUseCaseParams{

  final SubmitQualificationAndExperienceEntity submitQualificationAndExperienceEntity;

  SubmitRemoteQualificationAndExperienceUseCaseParams({required this.submitQualificationAndExperienceEntity});
}
