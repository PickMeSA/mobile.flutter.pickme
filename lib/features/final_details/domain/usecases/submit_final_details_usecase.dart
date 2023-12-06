import 'package:injectable/injectable.dart';
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:pickme/features/final_details/domain/entities/final_details_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';

import '../repository/submit_final_details_repository.dart';

@Injectable()
class SubmitFinalDetailsUseCase extends BaseUseCase<SubmitFinalDetailsUseCaseParams, ProfileEntity>{
  final SubmitFinalDetailsRepository submitFinalDetailsRepository;

  SubmitFinalDetailsUseCase({required this.submitFinalDetailsRepository});
  @override
  Future<ProfileEntity> call({SubmitFinalDetailsUseCaseParams? params}) async{
    try{
      return await submitFinalDetailsRepository.call(params: SubmitFinalDetailsRepositoryParams(finalDetailsEntity:params!.finalDetailsEntity));
    }catch(ex){
      rethrow;
    }
  }
}

class SubmitFinalDetailsUseCaseParams extends BaseUseCaseParams{
  final FinalDetailsEntity finalDetailsEntity;

  SubmitFinalDetailsUseCaseParams({required this.finalDetailsEntity});
}