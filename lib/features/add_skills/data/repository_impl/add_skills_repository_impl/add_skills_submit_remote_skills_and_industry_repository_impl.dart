import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/add_skills/domain/repository/add_skills_repository/add_skills_submit_remote_skills_and_industry_repository.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/services/remote/api_service/profile_service/profile_service.dart';

@Injectable(as: AddSkillsSubmitRemoteSkillsAndIndustryRepository)
class AddSkillsSubmitRemoteSkillsAndIndustryRepositoryImpl extends AddSkillsSubmitRemoteSkillsAndIndustryRepository {
    final ProfileService profileService;
  AddSkillsSubmitRemoteSkillsAndIndustryRepositoryImpl({required this.profileService});

  @override
  Future<ProfileEntity> call({AddSkillsSubmitRemoteSkillsAndIndustryRepositoryParams? params}) async {
    try{
      return await profileService.submitRemoteSkillsAndIndustry(skillsPageEntity: params!.skillsPageEntity);
    }catch(ex){
      rethrow;
    }
  }

}
