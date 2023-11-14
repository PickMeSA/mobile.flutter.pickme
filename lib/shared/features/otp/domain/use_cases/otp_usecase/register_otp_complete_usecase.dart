
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/register/domain/entities/user/user_model.dart';
import 'package:pickme/shared/features/otp/domain/repository/otp_repository/register_otp_complete_repository.dart';

@Injectable()
class RegisterOTPCompleteUseCase extends BaseUseCase<RegisterOTPCompleteUseCaseParams, bool>{

  final RegisterOTPCompleteRepository registerOTPCompleteEventRepository;

  RegisterOTPCompleteUseCase({required this.registerOTPCompleteEventRepository});

  @override
  Future<bool> call({RegisterOTPCompleteUseCaseParams? params})async {
    try{
      return await registerOTPCompleteEventRepository.call(
          params: RegisterOTPCompleteRepositoryParams(
              userModel: params!.userModel));
    }catch(ex){
      rethrow;
    }
  }
}

class RegisterOTPCompleteUseCaseParams extends BaseUseCaseParams{
  final UserModel userModel;

  RegisterOTPCompleteUseCaseParams({required this.userModel});
}
