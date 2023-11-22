
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/register/domain/entities/user/user_model.dart';
import 'package:pickme/shared/features/otp/domain/repository/otp_repository/otp_save_remote_profile_data_repository.dart';

@Injectable()
class OTPSaveRemoteProfileDataUseCase extends BaseUseCase<OTPSaveRemoteProfileDataUseCaseParams, bool>{

  final OTPSaveRemoteProfileDataRepository oTPSaveRemoteProfileDataRepository;

  OTPSaveRemoteProfileDataUseCase({required this.oTPSaveRemoteProfileDataRepository});

  @override
  Future<bool> call({OTPSaveRemoteProfileDataUseCaseParams? params}) async{
    try{
      return oTPSaveRemoteProfileDataRepository.call(params: OTPSaveRemoteProfileDataRepositoryParams(userModel: params!.userModel));
    }catch(ex){
      rethrow;
    }
  }
}

class OTPSaveRemoteProfileDataUseCaseParams extends BaseUseCaseParams{
  final UserModel userModel;

  OTPSaveRemoteProfileDataUseCaseParams({required this.userModel});
}
