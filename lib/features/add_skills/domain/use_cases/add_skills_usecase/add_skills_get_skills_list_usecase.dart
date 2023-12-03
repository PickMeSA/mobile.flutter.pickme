
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/add_skills/domain/entities/skill_list_entity.dart';
import 'package:pickme/features/add_skills/domain/repository/add_skills_repository/add_skills_get_skills_list_repository.dart';

@Injectable()
class AddSkillsGetSkillsListUseCase extends BaseUseCase<AddSkillsGetSkillsListUseCaseParams, SkillListEntity>{

  final AddSkillsGetSkillsListRepository addSkillsGetSkillsListRepository;

  AddSkillsGetSkillsListUseCase({required this.addSkillsGetSkillsListRepository});

  @override
  Future<SkillListEntity> call({AddSkillsGetSkillsListUseCaseParams? params}) async {
    try{
      return await addSkillsGetSkillsListRepository.call();
    }catch(ex){
      rethrow;
    }
  }
}

class AddSkillsGetSkillsListUseCaseParams extends BaseUseCaseParams{}
