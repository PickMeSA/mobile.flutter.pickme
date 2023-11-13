
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/login/domain/repository/login_repository/login_continue_clicked_repository.dart';
@Injectable()
class LoginContinueClickedUseCase extends BaseUseCase<LoginContinueClickedUseCaseParams, bool>{

  final LoginContinueClickedRepository loginContinueClickedRepository;

  LoginContinueClickedUseCase({required this.loginContinueClickedRepository});

  @override
  Future<bool> call({LoginContinueClickedUseCaseParams? params}) async {
    try{
      return await loginContinueClickedRepository.call(
          params: LoginContinueClickedRepositoryParams(mobileNumber: params!.mobileNumber));
    }catch(ex){
      rethrow;
    }
  }

  Future<void> callBack({
    Function(String? verificationId, int? resendToken)? onSuccesss,
    Function(String? error)? onError,
    required String mobileNumber
  })async{
    await loginContinueClickedRepository.callBack(mobileNumber: mobileNumber,
        onSuccess: (verificationId, resendToken) => onSuccesss!(verificationId,resendToken),
        onError: (error)=> onError!(error));
  }
}



class LoginContinueClickedUseCaseParams extends BaseUseCaseParams{
  final String mobileNumber;

  LoginContinueClickedUseCaseParams({required this.mobileNumber});
}
