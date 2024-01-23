
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/features/otp/domain/repository/otp_repository/login_otp_complete_event_repository.dart';

@Injectable()
class LoginOTPCompleteEventUseCase extends BaseUseCase<LoginOTPCompleteEventUseCaseParams, bool>{

  final LoginOTPCompleteEventRepository loginOTPCompleteEventRepository;

  LoginOTPCompleteEventUseCase({required this.loginOTPCompleteEventRepository});

  @override
  Future<bool> call({LoginOTPCompleteEventUseCaseParams? params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class LoginOTPCompleteEventUseCaseParams extends BaseUseCaseParams{}
