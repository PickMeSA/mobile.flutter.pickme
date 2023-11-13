
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/sign_up/domain/repository/sign_up_repository/submit_sign_up_repository.dart';
@Injectable()
class SubmitSignUpUseCase extends BaseUseCase<SubmitSignUpUseCaseParams, bool>{

  final SubmitSignUpRepository submitSignUpRepository;

  SubmitSignUpUseCase({required this.submitSignUpRepository});

  @override
  Future<bool> call({SubmitSignUpUseCaseParams? params}) {
    // TODO: implement call
    throw UnimplementedError();
  }

}

class SubmitSignUpUseCaseParams extends BaseUseCaseParams{}
