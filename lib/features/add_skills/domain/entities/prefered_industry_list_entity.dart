import 'package:pickme/features/add_skills/data/response_models/add_skills_model_response/add_skills_industry_list_model_response.dart';

import 'preferred_industry_entity.dart';

class PreferredIndustryListEntity {

    List<PreferredIndustryEntity>? preferredIndustryListEntity;

  PreferredIndustryListEntity({required this.preferredIndustryListEntity});

  PreferredIndustryListEntity.fromResponse({required AddSkillsIndustryListModelResponse addSkillsIndustryListModelResponse}){
    preferredIndustryListEntity = [];

    addSkillsIndustryListModelResponse.data.forEach((element) {
      preferredIndustryListEntity?.add(PreferredIndustryEntity.fromResponse(addSkillsIndustryModelResponse: element));
    });
  }
}