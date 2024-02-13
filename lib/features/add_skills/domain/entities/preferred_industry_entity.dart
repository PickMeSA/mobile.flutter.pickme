import 'package:equatable/equatable.dart';
import 'package:pickme/features/add_skills/data/response_models/add_skills_model_response/add_skills_industry_model_response.dart';

class PreferredIndustryEntity extends Equatable{
  
  
   String? industry;
   String? id;

  PreferredIndustryEntity({required this.industry, required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
  
  
  PreferredIndustryEntity.fromResponse({required AddSkillsIndustryModelResponse addSkillsIndustryModelResponse}){
    id = addSkillsIndustryModelResponse!.id!;
    industry = addSkillsIndustryModelResponse.industry;
  }

   AddSkillsIndustryModelResponse toResponse(){
     return AddSkillsIndustryModelResponse(id: id!, industry: industry!);
   }

   @override
   String toString() => industry!;
}