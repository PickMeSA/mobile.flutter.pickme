import 'package:firebase_auth/firebase_auth.dart';
import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/features/otp/domain/repository/otp_repository/otp_get_credential_repository.dart';
import 'package:pickme/shared/services/remote/authentication/authentication.dart';

@Injectable(as: OTPGetCredentialRepository)
class OTPGetCredentialRepositoryImpl extends OTPGetCredentialRepository {

  final Authentication authentication;
  OTPGetCredentialRepositoryImpl({required this.authentication});

  @override
  Future<UserCredential> call({OTPGetCredentialRepositoryParams? params}) async{
    try{
      return await authentication.getCredential(verificationId: params!.verificationID, smsCode: params!.smsCode);
    }catch(ex){
      rethrow;
    }
  }

}
