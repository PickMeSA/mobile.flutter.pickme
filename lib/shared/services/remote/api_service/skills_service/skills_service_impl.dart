import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/add_skills/data/response_models/add_skills_model_response/add_skills_skills_list_model_response.dart';
import 'package:pickme/features/add_skills/domain/entities/skill_list_entity.dart';
import 'package:pickme/shared/remote/api-service.dart';
import 'package:pickme/shared/services/remote/api_service/skills_service/skills_service.dart';

@Singleton(as:  SkillsService)
class SkillsServiceImpl extends SkillsService{

  final ApiService apiService;

  SkillsServiceImpl({required this.apiService});




  @override
  Future<SkillListEntity> getAllSkills({required String pageSize, required String pageNumber, required String searchTerms}) async {
    try{
      Response<dynamic> response = await apiService.get("$baseUrl$version/skills");
      AddSkillsSkillsListModelResponse addSkillsIndustryListModelResponse =
      AddSkillsSkillsListModelResponse.fromJson(response.data);
      SkillListEntity skillListEntity =
      SkillListEntity.fromResponse(addSkillsSkillsListModelResponse: addSkillsIndustryListModelResponse
          );
      return skillListEntity;
    }catch(ex){
      rethrow;
    }
  }

}