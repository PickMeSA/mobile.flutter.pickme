import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/features/add_skills/domain/entities/skill_list_entity.dart';

abstract class AddSkillsGetSkillsListRepository  extends BaseRepository<AddSkillsGetSkillsListRepositoryParams, SkillListEntity>{}

class AddSkillsGetSkillsListRepositoryParams extends BaseRepositoryParams{}
