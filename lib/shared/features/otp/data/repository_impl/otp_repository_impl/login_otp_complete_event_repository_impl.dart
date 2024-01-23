import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/features/otp/domain/repository/otp_repository/login_otp_complete_event_repository.dart';
import 'package:pickme/shared/services/local/Hive/profile_local_storage/profile_local_storage.dart';

@Injectable(as: LoginOTPCompleteEventRepository)
class LoginOTPCompleteEventRepositoryImpl extends LoginOTPCompleteEventRepository {

  final ProfileLocalStorage profileLocalStorage;
  LoginOTPCompleteEventRepositoryImpl({required this.profileLocalStorage});

  @override
  Future<bool> call({LoginOTPCompleteEventRepositoryParams? params}) {
    // TODO: implement call
    throw UnimplementedError();
  }

}
