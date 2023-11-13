import 'package:firebase_auth/firebase_auth.dart';
import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/login/domain/entities/token/token_model.dart';
import 'package:pickme/shared/features/otp/domain/repository/otp_repository/otp_get_token_repository.dart';
import 'package:pickme/shared/services/remote/authentication/authentication.dart';

@Injectable(as: OTPGetTokenRepository)
class OTPGetTokenRepositoryImpl extends OTPGetTokenRepository {

  final Authentication authentication;
  OTPGetTokenRepositoryImpl({required this.authentication});

  @override
  Future<TokenModel> call({OTPGetTokenRepositoryParams? params}) async{
    try{
      return await authentication.getToken(otp: params!.smsCode);
    }catch(ex){
      rethrow;
    }
  }

}
