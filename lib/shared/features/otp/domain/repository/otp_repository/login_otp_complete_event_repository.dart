import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/features/register/domain/entities/user/user_model.dart';

abstract class LoginOTPCompleteEventRepository  extends BaseRepository<LoginOTPCompleteEventRepositoryParams, bool>{}

class LoginOTPCompleteEventRepositoryParams extends BaseRepositoryParams{
  UserEntity? userModel;

  LoginOTPCompleteEventRepositoryParams({this.userModel});
}
