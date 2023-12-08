import 'package:pickme/features/add_skills/data/response_models/add_skills_model_response/add_skills_skills_model_response.dart';

class SkillEntity{

   String? skill;
   String? id;

  SkillEntity({required this.skill, required this.id});

  SkillEntity.fromResponse({required AddSkillsSkillsModelResponse addSkillsSkillsModelResponse}){
    skill = addSkillsSkillsModelResponse.skill!;
    id = addSkillsSkillsModelResponse.id!;
  }

   AddSkillsSkillsModelResponse toResponse() {
    return AddSkillsSkillsModelResponse(id: id!, skill: skill!);
   }
}