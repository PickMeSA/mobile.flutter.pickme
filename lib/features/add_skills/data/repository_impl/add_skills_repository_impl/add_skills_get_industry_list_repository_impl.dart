import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/add_skills/domain/entities/prefered_industry_list_entity.dart';
import 'package:pickme/features/add_skills/domain/repository/add_skills_repository/add_skills_get_industry_list_repository.dart';
import 'package:pickme/shared/services/remote/api_service/industry_service/industry_service.dart';

@Injectable(as: AddSkillsGetIndustryListRepository)
class AddSkillsGetIndustryListRepositoryImpl extends AddSkillsGetIndustryListRepository {
  final IndustryService industryService;
  AddSkillsGetIndustryListRepositoryImpl({required this.industryService});

  @override
  Future<PreferredIndustryListEntity> call({AddSkillsGetIndustryListRepositoryParams? params}) async {
    try{
      return await industryService.getPreferredIndustryList(pageSize: "40", pageNumber: "1", SearchTerm: "SearchTerm");
    }catch(ex){
      rethrow;
    }
  }

}
