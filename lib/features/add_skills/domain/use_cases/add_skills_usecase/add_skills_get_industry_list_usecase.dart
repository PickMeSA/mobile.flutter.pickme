
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/add_skills/domain/entities/prefered_industry_list_entity.dart';
import 'package:pickme/features/add_skills/domain/repository/add_skills_repository/add_skills_get_industry_list_repository.dart';

@Injectable()
class AddSkillsGetIndustryListUseCase extends BaseUseCase<AddSkillsGetIndustryListUseCaseParams, PreferredIndustryListEntity>{

  final AddSkillsGetIndustryListRepository addSkillsGetIndustryListRepository;

  AddSkillsGetIndustryListUseCase({required this.addSkillsGetIndustryListRepository});

  @override
  Future<PreferredIndustryListEntity> call({AddSkillsGetIndustryListUseCaseParams? params}) async{
    try{
      return await addSkillsGetIndustryListRepository.call();
    }catch(ex){
      rethrow;
    }
  }
}

class AddSkillsGetIndustryListUseCaseParams extends BaseUseCaseParams{
}
