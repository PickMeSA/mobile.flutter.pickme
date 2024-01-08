
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';

import '../entities/skill_list_entity.dart';
import '../repositories/get_skills_list_repository.dart';

@Injectable()
class GetSkillsListUseCase extends BaseUseCase<GetSkillsListUseCaseParams, JobsSkillListEntity>{

  final GetSkillsListRepository getSkillsListRepository;

  GetSkillsListUseCase({required this.getSkillsListRepository});

  @override
  Future<JobsSkillListEntity> call({GetSkillsListUseCaseParams? params}) async {
    try{
      return await getSkillsListRepository.call();
    }catch(ex){
      rethrow;
    }
  }
}

class GetSkillsListUseCaseParams extends BaseUseCaseParams{}
