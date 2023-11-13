import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/features/login/domain/entities/token/token_model.dart';

abstract class LoginContinueClickedRepository  extends BaseRepository<LoginContinueClickedRepositoryParams, bool>{

  Future<void> callBack({
    Function(String? verificationId, int? resendToken)? onSuccess,
    Function(String? error)? onError,
    required String mobileNumber});

}

class LoginContinueClickedRepositoryParams extends BaseRepositoryParams{

  final String mobileNumber;

  LoginContinueClickedRepositoryParams({required this.mobileNumber});


}
