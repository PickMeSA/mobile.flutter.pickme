import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/features/add_skills/domain/entities/prefered_industry_list_entity.dart';

abstract class AddSkillsGetIndustryListRepository  extends BaseRepository<AddSkillsGetIndustryListRepositoryParams, PreferredIndustryListEntity>{}

class AddSkillsGetIndustryListRepositoryParams extends BaseRepositoryParams{}
