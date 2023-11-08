
import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:pickme/core/exceptions/exception.dart';

import 'package:pickme/features/register/domain/repository/continue_clicked_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/services/remote/authentication/authentication.dart';


@Injectable(as: ContinueClickedRepository)
class ContinueClickedRepositoryImpl extends ContinueClickedRepository{

  Authentication authentication;

  ContinueClickedRepositoryImpl({required this.authentication});
  @override
  Future<bool> call({ContinueClickedRepositoryParams? params}) async {
    try {
      await safeBackEndCalls(apiRequest: authentication.authenticate(
          mobileNumber: params!.user.mobile));
      return true;
    }catch(ex){
    rethrow;
  };
  }

  
  @override
  Future<void> callBack(
  {Function(String? verificationId, int? resendToken)? onSuccess,
      Function(String? error)? onError,
      required mobileNumber}) async{
  
      await authentication.codeSent(mobileNumber: mobileNumber,
        onSuccess: (resendToken, verificationId) =>
            onSuccess!( resendToken,verificationId),
      onError: (error)=> onError!(error));
  }
  

  
}