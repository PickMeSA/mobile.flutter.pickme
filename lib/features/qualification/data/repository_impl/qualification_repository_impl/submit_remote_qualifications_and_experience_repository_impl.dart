import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/qualification/domain/repository/qualification_repository/submit_remote_qualifications_and_experience_repository.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/services/remote/api_service/profile_service/profile_service.dart';

@Injectable(as: SubmitRemoteQualificationAndExperienceRepository)
class SubmitRemoteQualificationAndExperienceRepositoryImpl extends SubmitRemoteQualificationAndExperienceRepository {

  final ProfileService profileService;

  SubmitRemoteQualificationAndExperienceRepositoryImpl({required this.profileService});

  @override
  Future<ProfileEntity> call({SubmitRemoteQualificationAndExperienceRepositoryParams? params})  async{
    try{
      return await profileService.submitWorkQualificationAndWorkExperience(submitQualificationAndExperienceEntity: params!.submitQualificationAndExperienceEntity);
    }catch(ex){
      rethrow;
    }
  }

}
