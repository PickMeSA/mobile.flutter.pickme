import 'package:pickme/features/jobs/shared/features/skills/domain/entities/skill_list_entity.dart';
import 'package:pickme/shared/remote/PickMeApiCore.dart';

abstract class JobsSkillsService extends PickMeCoreApi{

  Future<JobsSkillListEntity> getAllSkills({required String pageSize, required String pageNumber, required String searchTerms});
}