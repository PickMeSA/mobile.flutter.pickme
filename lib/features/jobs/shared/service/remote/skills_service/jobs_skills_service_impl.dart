import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/jobs/shared/features/skills/data/models/skills_list_model_response.dart';
import 'package:pickme/features/jobs/shared/features/skills/domain/entities/skill_list_entity.dart';
import 'package:pickme/features/jobs/shared/service/remote/skills_service/jobs_skills_service.dart';
import 'package:pickme/shared/remote/api-service.dart';
@Singleton(as:  JobsSkillsService)
class SkillsServiceImpl extends JobsSkillsService{

  final ApiService apiService;

  SkillsServiceImpl({required this.apiService});




  @override
  Future<JobsSkillListEntity> getAllSkills({required String pageSize, required String pageNumber, required String searchTerms}) async {
    try{
      Response<dynamic> response = await apiService.get("$baseUrl$version/skills");
      SkillsListModelResponse skillsListModelResponse =
      SkillsListModelResponse.fromJson(response.data);
      JobsSkillListEntity skillListEntity =
      JobsSkillListEntity.fromResponse(skillsListModelResponse: skillsListModelResponse
          );
      return skillListEntity;
    }catch(ex){
      rethrow;
    }
  }

}