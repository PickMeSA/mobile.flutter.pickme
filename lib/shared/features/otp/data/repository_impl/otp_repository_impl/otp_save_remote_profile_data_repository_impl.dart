import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/features/otp/domain/repository/otp_repository/otp_save_remote_profile_data_repository.dart';
import 'package:pickme/shared/services/remote/api_service/profile_service/profile_service.dart';

@Injectable(as: OTPSaveRemoteProfileDataRepository)
class OTPSaveRemoteProfileDataRepositoryImpl extends OTPSaveRemoteProfileDataRepository {
  ProfileService profileService;
  OTPSaveRemoteProfileDataRepositoryImpl({required this.profileService});

  @override
  Future<bool> call({OTPSaveRemoteProfileDataRepositoryParams? params}) async {
    try{
      return await profileService.saveRemoteProfileData(userModel: params!.userModel);
    }catch(ex){
      rethrow;
    }
  }

}
