import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/add_skills/domain/entities/skill_list_entity.dart';
import 'package:pickme/features/add_skills/domain/repository/add_skills_repository/add_skills_get_skills_list_repository.dart';
import 'package:pickme/shared/services/remote/api_service/skills_service/skills_service.dart';

@Injectable(as: AddSkillsGetSkillsListRepository)
class AddSkillsGetSkillsListRepositoryImpl extends AddSkillsGetSkillsListRepository {

  final SkillsService skillsService;

  AddSkillsGetSkillsListRepositoryImpl({required this.skillsService});

  @override
  Future<SkillListEntity> call({AddSkillsGetSkillsListRepositoryParams? params}) async {
   try{
     return await skillsService.getAllSkills(pageSize: "40", pageNumber: "1", searchTerms: "");
   }catch(ex){
     rethrow;
   }
  }

}
