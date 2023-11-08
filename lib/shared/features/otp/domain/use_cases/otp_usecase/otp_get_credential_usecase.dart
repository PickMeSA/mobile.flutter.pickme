
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/features/otp/domain/repository/otp_repository/otp_get_credential_repository.dart';


@Injectable()
class OTPGetCredentialUseCase extends BaseUseCase<OTPGetCredentialUseCaseParams, UserCredential>{

  final OTPGetCredentialRepository oTPGetCredentialRepository;

  OTPGetCredentialUseCase({required this.oTPGetCredentialRepository});

  @override
  Future<UserCredential> call({OTPGetCredentialUseCaseParams? params}) async {
   try{
     return await oTPGetCredentialRepository.call(
         params: OTPGetCredentialRepositoryParams(
             verificationID: params!.verificationID,
             smsCode: params!.smsCode));
   }catch(ex){
     rethrow;
   }
  }
}

class OTPGetCredentialUseCaseParams extends BaseUseCaseParams{

  final String smsCode;
  final String verificationID;

  OTPGetCredentialUseCaseParams({required this.smsCode,
    required this.verificationID});
}
