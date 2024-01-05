

import 'package:pickme/features/jobs/shared/features/skills/data/models/skills_model_response.dart';

class JobsSkillEntity{

   String? skill;
   String? id;

   JobsSkillEntity({required this.skill, required this.id});

   JobsSkillEntity.fromResponse({required SkillsModelResponse skillsModelResponse}){
    skill = skillsModelResponse.skill!;
    id = skillsModelResponse.id!;
  }

   SkillsModelResponse toResponse() {
    return SkillsModelResponse(id: id!, skill: skill!);
   }
}