import 'package:pickme/base_classes/base_usecase.dart';
import 'package:pickme/core/exceptions/exception.dart';
import 'package:pickme/features/register/domain/entities/user/user.dart';
import 'package:pickme/features/register/domain/repository/continue_clicked_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';


@injectable
class ContinueClickedUseCase extends BaseUseCase<ContinueClickedUseCaseParams, Either<bool,CustomException>>{

  final ContinueClickedRepository continueClickedRepository;

  ContinueClickedUseCase({required this.continueClickedRepository});
  @override
  Future<Either<bool, CustomException>> call({ContinueClickedUseCaseParams? params}) {
    return continueClickedRepository.call(params: ContinueClickedRepositoryParams(user: params!.user));
  }



}

class ContinueClickedUseCaseParams extends BaseUseCaseParams {

  final User user;
  ContinueClickedUseCaseParams({
    required this.user
  });
}