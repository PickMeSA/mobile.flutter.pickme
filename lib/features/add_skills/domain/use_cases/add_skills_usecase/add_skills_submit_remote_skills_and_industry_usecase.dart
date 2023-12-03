
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/add_skills/domain/entities/skills_page_entity.dart';
import 'package:pickme/features/add_skills/domain/repository/add_skills_repository/add_skills_submit_remote_skills_and_industry_repository.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';

@Injectable()
class AddSkillsSubmitRemoteSkillsAndIndustryUseCase extends BaseUseCase<AddSkillsSubmitRemoteSkillsAndIndustryUseCaseParams, ProfileEntity>{

  final AddSkillsSubmitRemoteSkillsAndIndustryRepository addSkillsSubmitRemoteSkillsAndIndustryRepository;

  AddSkillsSubmitRemoteSkillsAndIndustryUseCase({required this.addSkillsSubmitRemoteSkillsAndIndustryRepository});

  @override
  Future<ProfileEntity> call({AddSkillsSubmitRemoteSkillsAndIndustryUseCaseParams? params})async {
    try{
      return await addSkillsSubmitRemoteSkillsAndIndustryRepository.call(
          params: AddSkillsSubmitRemoteSkillsAndIndustryRepositoryParams(
              skillsPageEntity:params!.skillsPageEntity ));
    }catch(ex){
      rethrow;
    }
  }
}

class AddSkillsSubmitRemoteSkillsAndIndustryUseCaseParams extends BaseUseCaseParams{
  final SkillsPageEntity skillsPageEntity;

  AddSkillsSubmitRemoteSkillsAndIndustryUseCaseParams({required this.skillsPageEntity});

}
