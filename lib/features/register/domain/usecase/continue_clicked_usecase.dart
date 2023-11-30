import 'package:pickme/base_classes/base_usecase.dart';
import 'package:pickme/core/exceptions/exception.dart';
import 'package:pickme/features/register/domain/entities/user/user_model.dart';
import 'package:pickme/features/register/domain/repository/continue_clicked_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';


@injectable
class ContinueClickedUseCase extends BaseUseCase<ContinueClickedUseCaseParams, bool>{

  final ContinueClickedRepository continueClickedRepository;

  ContinueClickedUseCase({required this.continueClickedRepository});
  @override
  Future<bool> call({ContinueClickedUseCaseParams? params}) {

    try {
      return continueClickedRepository.call(
          params: ContinueClickedRepositoryParams(user: params!.user));
    }catch(ex){
      rethrow;
    }
  }

  Future<void> callBack({
    Function(String? verificationId, int? resendToken)? onSuccesss,
    Function(String? error)? onError,
    required String mobileNumber
  })async{
    await continueClickedRepository.callBack(mobileNumber: mobileNumber,
    onSuccess: (verificationId, resendToken) => onSuccesss!(verificationId,resendToken),
    onError: (error)=> onError!(error));
  }



}

class ContinueClickedUseCaseParams extends BaseUseCaseParams {

  final UserEntity user;
  ContinueClickedUseCaseParams({
    required this.user
  });
}