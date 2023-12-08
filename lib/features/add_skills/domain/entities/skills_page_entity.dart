
import 'package:pickme/features/add_skills/data/response_models/add_skills_model_response/add_skills_industry_model_response.dart';
import 'package:pickme/features/add_skills/data/response_models/add_skills_model_response/add_skills_skills_model_response.dart';
import 'package:pickme/features/add_skills/data/response_models/add_skills_model_response/add_skills_skills_page_model_response.dart';
import 'package:pickme/features/add_skills/domain/entities/preferred_industry_entity.dart';
import 'package:pickme/features/add_skills/domain/entities/skill_list_entity.dart';

class SkillsPageEntity {
  final PreferredIndustryEntity preferredIndustryEntity;
  final SkillListEntity skillListEntity;

  SkillsPageEntity({
    required this.skillListEntity,
    required this.preferredIndustryEntity
  });






}