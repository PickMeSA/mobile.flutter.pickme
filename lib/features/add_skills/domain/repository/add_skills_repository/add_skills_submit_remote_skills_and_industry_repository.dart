import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/features/add_skills/domain/entities/skills_page_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';

abstract class AddSkillsSubmitRemoteSkillsAndIndustryRepository  extends BaseRepository<AddSkillsSubmitRemoteSkillsAndIndustryRepositoryParams, ProfileEntity>{}

class AddSkillsSubmitRemoteSkillsAndIndustryRepositoryParams extends BaseRepositoryParams{

  final SkillsPageEntity skillsPageEntity;

  AddSkillsSubmitRemoteSkillsAndIndustryRepositoryParams({required this.skillsPageEntity});
}
