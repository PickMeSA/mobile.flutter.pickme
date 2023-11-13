
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/login/domain/entities/token/token_model.dart';
import 'package:pickme/shared/features/otp/domain/repository/otp_repository/otp_get_token_repository.dart';


@Injectable()
class OTPGetTokenUseCase extends BaseUseCase<OTPGetTokenUseCaseParams, TokenModel>{

  final OTPGetTokenRepository oTPGetTokenRepository;

  OTPGetTokenUseCase({required this.oTPGetTokenRepository});

  @override
  Future<TokenModel> call({OTPGetTokenUseCaseParams? params}) async {
   try{
     return await oTPGetTokenRepository.call(
         params: OTPGetTokenRepositoryParams(
             verificationID: params!.verificationID,
             smsCode: params!.smsCode));
   }catch(ex){
     rethrow;
   }
  }
}

class OTPGetTokenUseCaseParams extends BaseUseCaseParams{

  final String smsCode;
  final String verificationID;

  OTPGetTokenUseCaseParams({required this.smsCode,
    required this.verificationID});
}
