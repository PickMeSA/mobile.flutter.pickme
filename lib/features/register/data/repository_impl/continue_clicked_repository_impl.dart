
import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:pickme/core/exceptions/exception.dart';
import 'package:pickme/features/register/data/service/user_service.dart';
import 'package:pickme/features/register/domain/repository/continue_clicked_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: ContinueClickedRepository)
class ContinueClickedRepositoryImpl extends ContinueClickedRepository{

  UserService userService;

  ContinueClickedRepositoryImpl({required this.userService});
  @override
  Future<Either<bool, CustomException>> call({ContinueClickedRepositoryParams? params}) async {
     return Left(await safeBackEndCalls(apiRequest: userService.registerUser(user: params!.user)));
  }
  
}