import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/add_skills/data/response_models/add_skills_model_response/add_skills_industry_list_model_response.dart';
import 'package:pickme/features/add_skills/domain/entities/prefered_industry_list_entity.dart';
import 'package:pickme/features/add_skills/domain/entities/preferred_industry_entity.dart';
import 'package:pickme/shared/remote/api-service.dart';
import 'package:pickme/shared/services/remote/api_service/industry_service/industry_service.dart';

@Singleton(as: IndustryService)
class IndustryServiceImpl extends IndustryService{

  final ApiService apiService;

  IndustryServiceImpl({required this.apiService});
  @override
  Future<PreferredIndustryEntity> getPreferredIndustryEntity({required String industryId}) {
    // TODO: implement getPreferredIndustryEntity
    throw UnimplementedError();
  }

  @override
  Future<PreferredIndustryListEntity> getPreferredIndustryList({required String pageSize, required String pageNumber, required String SearchTerm}) async{
    try{
      Response<dynamic> response = await apiService.get("$baseUrl$version/industries");
      AddSkillsIndustryListModelResponse addSkillsIndustryListModelResponse =
      AddSkillsIndustryListModelResponse.fromJson(response.data);
      PreferredIndustryListEntity preferredIndustryListEntity =
      PreferredIndustryListEntity.fromResponse(
          addSkillsIndustryListModelResponse: addSkillsIndustryListModelResponse);
      return preferredIndustryListEntity;

    }catch(ex){
      rethrow;
    }
  }

}