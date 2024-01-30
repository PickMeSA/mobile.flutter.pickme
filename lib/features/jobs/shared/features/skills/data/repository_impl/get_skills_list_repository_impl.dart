import 'package:injectable/injectable.dart';
import 'package:pickme/features/jobs/shared/features/skills/domain/entities/skill_list_entity.dart';
import 'package:pickme/features/jobs/shared/features/skills/domain/repositories/get_skills_list_repository.dart';
import 'package:pickme/shared/services/remote/api_service/job_skills_service/jobs_skills_service.dart';

@Injectable(as: GetSkillsListRepository)
class GetSkillsListRepositoryImpl extends GetSkillsListRepository {

  final JobsSkillsService skillsService;

  GetSkillsListRepositoryImpl({required this.skillsService});

  @override
  Future<JobsSkillListEntity> call({GetSkillsListRepositoryParams? params}) async {
   try{
     return skillsService.getAllSkills(pageSize: "40", pageNumber: "1", searchTerms: "");
   }catch(ex){
     rethrow;
   }
  }

}
