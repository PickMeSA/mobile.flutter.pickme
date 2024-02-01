
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/profile/domain/repository/profile_repository/delete_profile_repository.dart';

@Injectable()
class DeleteProfileUseCase extends BaseUseCase<DeleteProfileUseCaseParams, bool>{

  final DeleteProfileRepository deleteProfileRepository;

  DeleteProfileUseCase({required this.deleteProfileRepository});

  @override
  Future<bool> call({DeleteProfileUseCaseParams? params}) async {
  try{
    return await deleteProfileRepository.call();
  }catch(ex){
    rethrow;
  }
  }
}

class DeleteProfileUseCaseParams extends BaseUseCaseParams{}
