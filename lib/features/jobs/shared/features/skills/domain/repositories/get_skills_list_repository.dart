import 'package:pickme/base_classes/base_repository.dart';

import '../entities/skill_list_entity.dart';

abstract class GetSkillsListRepository  extends BaseRepository<GetSkillsListRepositoryParams, JobsSkillListEntity>{}

class GetSkillsListRepositoryParams extends BaseRepositoryParams{}
