import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/features/register/domain/entities/user/user_model.dart';

abstract class RegisterOTPCompleteRepository  extends BaseRepository<RegisterOTPCompleteRepositoryParams, bool>{}

class RegisterOTPCompleteRepositoryParams extends BaseRepositoryParams{

  final UserEntity userModel;

  RegisterOTPCompleteRepositoryParams({required this.userModel});
}
