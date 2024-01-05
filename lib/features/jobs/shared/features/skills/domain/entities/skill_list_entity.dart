

import 'package:pickme/features/jobs/shared/features/skills/data/models/skills_list_model_response.dart';
import 'package:pickme/features/jobs/shared/features/skills/data/models/skills_model_response.dart';
import 'package:pickme/features/jobs/shared/features/skills/domain/entities/skill_entity.dart';

class JobsSkillListEntity{

  List<JobsSkillEntity>? skillListEntity ;

  JobsSkillListEntity({required this.skillListEntity});

  JobsSkillListEntity.fromResponse({required SkillsListModelResponse skillsListModelResponse}){

    skillListEntity = [];
    skillsListModelResponse.data?.forEach((element) {
      skillListEntity?.add(JobsSkillEntity.fromResponse(skillsModelResponse: element));
    });

  }

  SkillsListModelResponse toResponse(){
    List<SkillsModelResponse>  skillsListModelResponse = [];
    List<int> skillsIds = [];

    skillListEntity?.forEach((element) {
      skillsIds.add(int.parse(element.id!));
      skillsListModelResponse.add(element.toResponse());
    });
    return SkillsListModelResponse(
        data: skillsListModelResponse,
        skillIds: skillsIds);
  }
}