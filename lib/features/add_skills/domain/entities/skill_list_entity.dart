import 'package:pickme/features/add_skills/data/response_models/add_skills_model_response/add_skills_skills_list_model_response.dart';
import 'package:pickme/features/add_skills/data/response_models/add_skills_model_response/add_skills_skills_model_response.dart';
import 'package:pickme/features/add_skills/domain/entities/skill_entity.dart';

class SkillListEntity{

  List<SkillEntity>? skillListEntity ;

  SkillListEntity({required this.skillListEntity});

  SkillListEntity.fromResponse({required AddSkillsSkillsListModelResponse addSkillsSkillsListModelResponse}){

    skillListEntity = [];

    addSkillsSkillsListModelResponse.data?.forEach((element) {
      skillListEntity?.add(SkillEntity.fromResponse(addSkillsSkillsModelResponse: element));
    });

  }

  AddSkillsSkillsListModelResponse toResponse(){
    List<AddSkillsSkillsModelResponse>  addSkillsSkillsListModelResponse = [];
    List<int> skillIds = [];

    skillListEntity?.forEach((element) {
      skillIds.add(int.parse(element.id!));
      addSkillsSkillsListModelResponse.add(element.toResponse());
    });
    return AddSkillsSkillsListModelResponse(
        data: addSkillsSkillsListModelResponse,
        skillIds: skillIds);
  }
}