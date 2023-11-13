
import 'package:injectable/injectable.dart';
import 'package:pickme/features/login/domain/entities/token/token_model.dart';
import 'package:pickme/features/login/domain/repository/login_repository/login_continue_clicked_repository.dart';
import 'package:pickme/shared/services/remote/authentication/authentication.dart';

@Injectable(as: LoginContinueClickedRepository)
class LoginContinueClickedRepositoryImpl extends LoginContinueClickedRepository {
final Authentication authentication;
  LoginContinueClickedRepositoryImpl({required this.authentication});

  @override
  Future<bool> call({LoginContinueClickedRepositoryParams? params}) async{
    try{
       await authentication.codeSent(mobileNumber: params!.mobileNumber);
       return true;
    }catch(ex){
      rethrow;
    }
  }

@override
Future<void> callBack(
    {Function(String? verificationId, int? resendToken)? onSuccess,
      Function(String? error)? onError,
      required mobileNumber}) async{
  await authentication.codeSent(mobileNumber: mobileNumber,
      onSuccess: (verificationId, resentCode) =>
          onSuccess!(verificationId, resentCode ),
      onError: (error)=> onError!(error));
}

}
