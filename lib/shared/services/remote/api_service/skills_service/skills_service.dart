import 'package:pickme/features/add_skills/domain/entities/skill_list_entity.dart';
import 'package:pickme/shared/remote/PickMeApiCore.dart';

abstract class SkillsService extends PickMeCoreApi{

  Future<SkillListEntity> getAllSkills({required String pageSize, required String pageNumber, required String searchTerms});
}