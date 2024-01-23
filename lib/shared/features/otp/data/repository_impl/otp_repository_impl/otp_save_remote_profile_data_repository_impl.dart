import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/register/domain/entities/user/user_model.dart';
import 'package:pickme/shared/features/otp/domain/repository/otp_repository/otp_save_remote_profile_data_repository.dart';
import 'package:pickme/shared/services/remote/api_service/user_service/user_service.dart';

@Injectable(as: OTPSaveRemoteProfileDataRepository)
class OTPSaveRemoteProfileDataRepositoryImpl extends OTPSaveRemoteProfileDataRepository {
  UserService userService;
  OTPSaveRemoteProfileDataRepositoryImpl({required this.userService});

  @override
  Future<UserEntity> call({OTPSaveRemoteProfileDataRepositoryParams? params}) async {
    try{
      return await userService.saveRemoteProfileData(userModel: params!.userModel);
    }catch(ex){
      rethrow;
    }
  }

}
